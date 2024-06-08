import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BMI Calculator',
      home: BMICalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double height = 0;
  double weight = 0;
  double bmi = 0;
  String weightCategory = '';
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void calculateBMI() {
    setState(() {
      height = double.parse(heightController.text) / 100;
      weight = double.parse(weightController.text);
      bmi = (weight / (height * height));

      if (bmi < 18.5) {
        weightCategory = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        weightCategory = 'Normal weight';
      } else if (bmi >= 25 && bmi < 29.9) {
        weightCategory = 'Overweight';
      } else {
        weightCategory = 'Obesity';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 240, 240),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 48, 109, 156),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                filled: true,
                fillColor: Color.fromARGB(255, 213, 131, 131),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                filled: true,
                fillColor: Color.fromARGB(255, 214, 127, 127),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color.fromARGB(255, 245, 248, 247),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: bmi > 0 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    'BMI: ${bmi.toStringAsFixed(1)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 5, 8),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Weight Category: $weightCategory',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
