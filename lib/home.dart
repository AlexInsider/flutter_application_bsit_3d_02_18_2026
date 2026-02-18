import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final TextEditingController textField1 = TextEditingController();
  final TextEditingController textField2 = TextEditingController();

  double product = 0;

  void func(String operator){
    try {
      setState(() {
        switch(operator){
          case "add":
            product = double.parse(textField1.text) + double.parse(textField2.text);
            break;
          case "multiply":
            product = double.parse(textField1.text) * double.parse(textField2.text);
            break;
          case "subtract":
            product = double.parse(textField1.text) - double.parse(textField2.text);
            break;
          case "divide":
            product = double.parse(textField1.text) / double.parse(textField2.text);
            break;
          default: product = 0;
        }
      });
    }catch(error){
      setState(() {
        product = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textField1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: textField2,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
            Text("Output: $product"),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                func("add");
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text("Multiply"),
              onPressed: () {
                func("multiply");
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text("Subtract"),
              onPressed: () {
                func("subtract");
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text("Divide"),
              onPressed: () {
                func("divide");
              },
            ),
          ],
        ),
      ),
    );
  }
}