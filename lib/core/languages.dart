class AppLanguages {
  static Map<String, String> supported = {
    "English": "en",
    "Hindi": "hi",
    "Tamil": "ta",
    "Telugu": "te",
    "Marathi": "mr",
    "Gujarati": "gu",
    "Bengali": "bn",
  };

  static String currentLabel = "English";
  static String currentCode = "en";

  /// Speech locale mapping
  static String get speechLocale {
    switch (currentCode) {
      case "hi":
        return "hi-IN";
      case "ta":
        return "ta-IN";
      case "te":
        return "te-IN";
      case "mr":
        return "mr-IN";
      case "gu":
        return "gu-IN";
      case "bn":
        return "bn-IN";
      default:
        return "en-US";
    }
  }

  static String t(String key) {
    final map = {
      "assistant": {
        "en": "Assistant",
        "hi": "सहायक",
      },
      "type_hint": {
        "en": "Type or speak...",
        "hi": "लिखें या बोलें...",
      },
      "speak": {
        "en": "Speak",
        "hi": "बोलें",
      },
      "stop": {
        "en": "Stop",
        "hi": "रोकें",
      },
      "go": {
        "en": "Send",
        "hi": "भेजें",
      },
    };

    return map[key]?[currentCode] ?? map[key]?["en"] ?? key;
  }
}
