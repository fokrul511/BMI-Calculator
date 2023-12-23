import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Check Your Health With BMI♥',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  //Wight
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Wight( in kg)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  //Hight
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height( in feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  //in
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height( in inch)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 22),
                  //button............
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 44),
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    child: const Text('Check'),
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        //calculate
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);
                        //
                        var tInch = (ift * 12) + iInch;
                        var tcm = tInch * 2.54; //tInch
                        var tM = tcm / 100;
                        var bmi = iwt / (tM * tM);

                        //again health bmi
                        var msg = "";
                        if (bmi > 25) {
                          msg = 'Yor are Over Wight!!😒';
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You're UnderWight!!🤷‍♀️";
                          bgColor = Colors.orange.shade300;
                        } else {
                          msg = "You're Healthy!!😍";
                          bgColor = Colors.green.shade200;
                        }
                        //
                        setState(() {
                          result =
                              "$msg\nYour BMi Health Is:${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = 'Please Required all Blanks';
                        });
                      }
                      wtController.clear();
                      ftController.clear();
                      inController.clear();
                    },
                  ),
                  const SizedBox(height: 100),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Text(result,
                        style:
                            const TextStyle(fontSize: 22, color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
