import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/converter_provider.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<ConverterProvider>().inputText;

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final inputText = context.watch<ConverterProvider>().inputText;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Colors.blueAccent,
        ),
        decoration: InputDecoration(
          hintText: "0.00",
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 18),
          prefixIcon: const Icon(Icons.calculate_outlined, color: Colors.blueAccent),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              _controller.clear();
              context.read<ConverterProvider>().updateInput('');
            },
          )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),


          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blue.shade50, width: 2),
          ),


          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2.5),
          ),
        ),
        onChanged: (value) {
          context.read<ConverterProvider>().updateInput(value);
        },
      ),
    );
  }
}
