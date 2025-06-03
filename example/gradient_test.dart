import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() {
  runApp(GradientTestApp());
}

class GradientTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GradientTestPage(),
    );
  }
}

class GradientTestPage extends StatefulWidget {
  @override
  _GradientTestPageState createState() => _GradientTestPageState();
}

class _GradientTestPageState extends State<GradientTestPage> {
  int currentStep = 3;
  final int totalSteps = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient Test - Step $currentStep/$totalSteps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Test 1: Basic gradient with custom sizes
            Text('With custom sizes and gradient:'),
            SizedBox(height: 10),
            StepProgressIndicator(
              animationDuration: const Duration(milliseconds: 600),
              customSize: (index, selected) => index == currentStep - 1 ? 10 : 6,
              totalSteps: totalSteps,
              currentStep: currentStep,
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey[300]!,
              selectedGradientColor: LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              roundedEdges: const Radius.circular(8),
              padding: 4,
            ),
            
            SizedBox(height: 40),
            
            // Test 2: Without gradient to compare
            Text('Without gradient (for comparison):'),
            SizedBox(height: 10),
            StepProgressIndicator(
              animationDuration: const Duration(milliseconds: 600),
              customSize: (index, selected) => index == currentStep - 1 ? 10 : 6,
              totalSteps: totalSteps,
              currentStep: currentStep,
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey[300]!,
              roundedEdges: const Radius.circular(8),
              padding: 4,
            ),
            
            SizedBox(height: 40),
            
            // Test 3: Gradient should span from blue to purple across selected steps only
            Text('Gradient span visualization:'),
            SizedBox(height: 10),
            Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Text('↑ This gradient should span only across selected steps (1-$currentStep)'),
            
            SizedBox(height: 60),
            
            // Control buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: currentStep > 0
                      ? () {
                          setState(() {
                            currentStep--;
                          });
                        }
                      : null,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: currentStep < totalSteps
                      ? () {
                          setState(() {
                            currentStep++;
                          });
                        }
                      : null,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}