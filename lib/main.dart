import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String output1 = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      String output = "0";
      String output1 = "0";
      double n1 = 0.0;
      double n2 = 0.0;
      String operand = "";
    } else if (buttonText == "+" ||
        buttonText == "_" ||
        buttonText == "X" ||
        buttonText == "/") {
      n1 = double.parse(output);
      operand = buttonText;
      output = "0";
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        print("aleready contains a decimals");
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      n2 = double.parse(output);
    }
    if (operand == "+") {
      output = (n1 + n2).toString();
    }
    if (operand == "-") {
      output = (n1 - n2).toString();
    }
    if (operand == "X") {
      output = (n1 * n2).toString();
    }
    if (operand == "/") {
      output = (n1 / n2).toString();

      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    } else {
      output = output + buttonText;
    }
    print(output);
    setState(() {
      output = double.parse(output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(40),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {buttonPressed(buttonText)},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0,
                  ),
                  child: new Text(
                    output,
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              new Expanded(
                child: new Divider(),
              ),
              new Column(children: [
                new Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ]),
                new Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X"),
                ]),
                new Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("_"),
                ]),
                new Row(children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ]),
                new Row(children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ]),
              ])
            ],
          ),
        ));
  }
}
