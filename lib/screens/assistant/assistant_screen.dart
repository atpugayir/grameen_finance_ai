import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/languages.dart';
import '../../services/voice_service.dart';
import '../../services/audio_service.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final SpeechToText _speech = SpeechToText();
  final TextEditingController _textController = TextEditingController();

  bool _speechAvailable = false;
  bool isListening = false;
  bool isLoading = false;

  String inputText = "";
  String replyText = "";

  // 🔴 IMPORTANT: backend base URL
  static const String backendBaseUrl = "http://127.0.0.1:8000";
  // For Android emulator, use:
  // static const String backendBaseUrl = "http://10.0.2.2:8000";

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    _speechAvailable = await _speech.initialize(
      onStatus: (status) {
        if (status == "done" || status == "notListening") {
          setState(() => isListening = false);
        }
      },
      onError: (error) {
        setState(() => isListening = false);
      },
    );
  }

  Future<void> startListening() async {
    if (!_speechAvailable || isLoading) return;

    setState(() {
      isListening = true;
      inputText = "";
      _textController.clear();
    });

    await _speech.listen(
      localeId: AppLanguages.speechLocale,
      partialResults: true,
      onResult: (result) {
        setState(() {
          inputText = result.recognizedWords;
          _textController.text = inputText;
        });
      },
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
    setState(() => isListening = false);
  }

  Future<void> send() async {
    if (inputText.trim().isEmpty || isLoading) return;

    setState(() => isLoading = true);

    try {
      final res = await VoiceService.askAssistant(
        inputText,
        AppLanguages.currentCode,
      );

      setState(() {
        replyText = res["reply"] ?? "";
        isLoading = false;
        inputText = "";
        _textController.clear();
      });

      // ✅ ABSOLUTE AUDIO URL (FIXED)
      if (res["audio_url"] != null) {
        final String fullAudioUrl =
            "$backendBaseUrl${res["audio_url"]}";

        debugPrint("Playing audio: $fullAudioUrl");

        await AudioService.playFromUrl(fullAudioUrl);
      }
    } catch (e) {
      setState(() {
        replyText = "❌ Assistant not reachable";
        isLoading = false;
      });
    }
  }

  void pickLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView(
        children: AppLanguages.supported.entries.map((e) {
          return ListTile(
            title: Text(e.key),
            onTap: () {
              setState(() {
                AppLanguages.currentLabel = e.key;
                AppLanguages.currentCode = e.value;
              });
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${AppLanguages.t("assistant")} • ${AppLanguages.currentLabel}",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: pickLanguage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: AppLanguages.t("type_hint"),
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) => inputText = v,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Text(
                        replyText,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(isListening ? Icons.stop : Icons.mic),
                    label: Text(
                      isListening
                          ? AppLanguages.t("stop")
                          : AppLanguages.t("speak"),
                    ),
                    onPressed: isLoading
                        ? null
                        : (isListening ? stopListening : startListening),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.send),
                    label: Text(AppLanguages.t("go")),
                    onPressed: isLoading ? null : send,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
