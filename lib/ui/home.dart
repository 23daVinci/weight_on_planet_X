import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppBody();
  }
}

class AppBody extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _fixedResultText;

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
      if (_weightController.text.isEmpty) {
        _finalResult = 0.0;
        _fixedResultText = "Please enter your weight";
      } else {
        switch (radioValue) {
          case 0:
            _finalResult = calculateWeight(_weightController.text, 0.06);
            _fixedResultText = "Your weight on Pluto is";
            break;
          case 1:
            _finalResult = calculateWeight(_weightController.text, 0.38);
            _fixedResultText =
                "Your weight on Mars is ${_finalResult.toStringAsFixed(1)} Kilos";
            break;
          case 2:
            _finalResult = calculateWeight(_weightController.text, 0.91);
            _fixedResultText =
                "Your weight on Venus is ${_finalResult.toStringAsFixed(1)} Kelos";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // app bar
      appBar: new AppBar(
        backgroundColor: Colors.purple.shade900,
        title: new Text("Weight on Planet X"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      // body
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            // icon
            new Image.asset(
              'images/planetLogo.png',
              height: 200.0,
              width: 200.0,
            ),

            // container for textfield
            new Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: new InputDecoration(
                        labelText: "Your weight on Earth",
                        hintText: "In Kilograms",
                        icon: new Icon(
                          Icons.person_outline,
                          color: Colors.purple.shade900,
                        ),
                        labelStyle:
                            new TextStyle(color: Colors.purple.shade900)),
                  ),

                  new Padding(padding: new EdgeInsets.all(15.0)),

                  // radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange),
                      new Text(
                        "Pluto",
                        style: new TextStyle(fontSize: 17.0),
                      ),
                      new Radio<int>(
                          activeColor: Colors.redAccent.shade700,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange),
                      new Text(
                        "Mars",
                        style: new TextStyle(fontSize: 17.0),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange),
                      new Text(
                        "Venus",
                        style: new TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(15.0)),

                  // display result
                  new Text(
                    _weightController.text.isEmpty
                        ? "Please enter your weight"
                        : _fixedResultText,
                    style: new TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // result weight
                  new Text(
                    "${_finalResult.toStringAsFixed(1)} Kelos",
                    style: new TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent.shade700,
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

  // ignore: missing_return
  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrongg");
      return int.parse("180") * 0.38;
    }
  }
}
