import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final bankNameCtrl = TextEditingController();
  final bankAccountCtrl = TextEditingController();

  String gender = "Male";
  String designation = "Farmer";

  @override
  void dispose() {
    nameCtrl.dispose();
    ageCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    bankNameCtrl.dispose();
    bankAccountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("Full Name", nameCtrl),
              _field("Age", ageCtrl, number: true),
              _field("Phone", phoneCtrl, number: true),
              _field("Email", emailCtrl),
              _field("Bank Name", bankNameCtrl),
              _field("Bank Account Number", bankAccountCtrl, number: true),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (v) => setState(() => gender = v!),
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: designation,
                decoration: const InputDecoration(
                  labelText: "Designation",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "Farmer", child: Text("Farmer")),
                  DropdownMenuItem(value: "Student", child: Text("Student")),
                  DropdownMenuItem(value: "Worker", child: Text("Worker")),
                ],
                onChanged: (v) => setState(() => designation = v!),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Create Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final age = int.tryParse(ageCtrl.text);
    if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid age")),
      );
      return;
    }

    final user = UserModel(
      name: nameCtrl.text.trim(),
      age: age,
      gender: gender,
      phone: phoneCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      bankName: bankNameCtrl.text.trim(),
      bankAccount: bankAccountCtrl.text.trim(),
      designation: designation,
    );

    // ✅ Navigate to HOME (Bottom Navigation Screen)
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    bool number = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType:
            number ? TextInputType.number : TextInputType.text,
        validator: (v) =>
            v == null || v.trim().isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
