import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  String? _gender;
  double _weight = 70;
  int _age = 23;
  String _height = '';
  double? _bmi;
  String? _bmiCategory;

  void _calculateBMI() {
    if (_height.isEmpty) return;

    double heightInMeters = double.parse(_height) / 100;
    double bmiValue = _weight / (heightInMeters * heightInMeters);

    setState(() {
      _bmi = double.parse(bmiValue.toStringAsFixed(1));
      if (bmiValue < 18.5)
        _bmiCategory = 'Underweight';
      else if (bmiValue >= 18.5 && bmiValue < 25)
        _bmiCategory = 'Normal';
      else if (bmiValue >= 25 && bmiValue < 30)
        _bmiCategory = 'Overweight';
      else
        _bmiCategory = 'Obese';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.male),
                    label: Text('Male'),
                    onPressed: () => setState(() => _gender = 'male'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _gender == 'male' ? Colors.blue : Colors.white,
                      foregroundColor: _gender == 'male' ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.female),
                    label: Text('Female'),
                    onPressed: () => setState(() => _gender = 'female'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _gender == 'female' ? Colors.blue : Colors.white,
                      foregroundColor: _gender == 'female' ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Weight', style: TextStyle(color: Colors.grey)),
                          Text('$_weight', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => setState(() => _weight--),
                                color: Colors.blue,
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => setState(() => _weight++),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(  // Wrap the TextField in an Expanded widget
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Height',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _height = value,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (_bmi != null)
              Text(
                '$_bmi\n$_bmiCategory',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Lets Go'),
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
