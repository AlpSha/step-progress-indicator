import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() {
  runApp(AnimatedExampleApp());
}

class AnimatedExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Step Progress Indicator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedExamplePage(),
    );
  }
}

class AnimatedExamplePage extends StatefulWidget {
  @override
  _AnimatedExamplePageState createState() => _AnimatedExamplePageState();
}

class _AnimatedExamplePageState extends State<AnimatedExamplePage> {
  int currentStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Step Progress Indicator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Step: $currentStep',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            
            // Basic animated step progress indicator
            StepProgressIndicator(
              totalSteps: 10,
              currentStep: currentStep,
              size: 40,
              selectedColor: Colors.green,
              unselectedColor: Colors.grey[300]!,
              padding: 4,
              animationDuration: Duration(milliseconds: 500),
              animationCurve: Curves.easeInOut,
            ),
            
            SizedBox(height: 40),
            
            // With gradient
            StepProgressIndicator(
              totalSteps: 10,
              currentStep: currentStep,
              size: 40,
              padding: 0,
              selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple],
              ),
              unselectedColor: Colors.grey[300]!,
              animationDuration: Duration(milliseconds: 300),
              animationCurve: Curves.fastOutSlowIn,
            ),
            
            SizedBox(height: 40),
            
            // With rounded edges
            StepProgressIndicator(
              totalSteps: 10,
              currentStep: currentStep,
              size: 40,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[300]!,
              padding: 4,
              roundedEdges: Radius.circular(20),
              animationDuration: Duration(milliseconds: 700),
              animationCurve: Curves.elasticOut,
            ),
            
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
                  onPressed: currentStep < 10
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
            
            SizedBox(height: 20),
            
            // Reset button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentStep = 0;
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}