import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    textControllerField1.addListener(fieldListener1);
    textControllerField2.addListener(fieldListener2);
    super.initState();
  }

  bool isFieldOne = true;
  double field1 = 0.0, field2 = 0.0;
  var textControllerField1 = TextEditingController(text: '0');
  var textControllerField2 = TextEditingController(text: '0');
  var dropDownItems = ['C', 'F', 'K'];
  var selectedField1 = 'C';
  var selectedField2 = 'F';

  fieldListener1() {
    setState(() {
      field1 = double.parse(textControllerField1.text);
      if (isFieldOne) {
        switch (selectedField1) {
          case 'C':
            switch (selectedField2) {
              case 'F':
                field2 = convertCtoF(field1);
                break;
              case 'K':
                field2 = convertCtoK(field1);
                break;
              default:
                field2 = field1;
                break;
            }
            break;
          case 'F':
            switch (selectedField2) {
              case 'C':
                field2 = convertFtoC(field1);
                break;
              case 'K':
                field2 = convertFtoK(field1);
                break;
              default:
                field2 = field1;
                break;
            }
            break;
          case 'K':
            switch (selectedField2) {
              case 'C':
                field2 = convertKtoC(field1);
                break;
              case 'F':
                field2 = convertKtoF(field1);
                break;
              default:
                field2 = field1;
                break;
            }
            break;
          default:
            break;
        }
        textControllerField2.text = field2.toString();
      }
      isFieldOne = true;
    });
  }

  fieldListener2() {
    setState(() {
      field2 = double.parse(textControllerField2.text);

      if (!isFieldOne) {
        switch (selectedField2) {
          case 'C':
            switch (selectedField1) {
              case 'F':
                field1 = convertCtoF(field2);
                break;
              case 'K':
                field1 = convertCtoK(field2);
                break;
              default:
                field1 = field2;
                break;
            }
            break;
          case 'F':
            switch (selectedField1) {
              case 'C':
                field1 = convertFtoC(field2);
                break;
              case 'K':
                field1 = convertFtoK(field2);
                break;
              default:
                field1 = field2;
                break;
            }
            break;
          case 'K':
            switch (selectedField1) {
              case 'C':
                field2 = convertKtoC(field2);
                break;
              case 'F':
                field2 = convertKtoF(field2);
                break;
              default:
                field2 = field2;
                break;
            }
            break;
          default:
            break;
        }
        textControllerField1.text = field1.toString();
      }
      isFieldOne = false;
    });
  }

  double convertCtoF(double value) {
    return ((value) * (9 / 5)) + (32);
  }

  double convertCtoK(double value) {
    return value + 273.15;
  }

  double convertFtoC(double value) {
    return (value - 32) * (5 / 9);
  }

  double convertFtoK(double value) {
    return (((75 * value) + 459.67)) * (5 / 9);
  }

  double convertKtoC(double value) {
    return value - 273.15;
  }

  double convertKtoF(double value) {
    return (1.8 * (value - 273) + 32);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Converting Temp'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      items: dropDownItems
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedField1 = value;
                        });
                      },
                      value: selectedField1,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      items: dropDownItems
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedField2 = value;
                        });
                      },
                      value: selectedField2,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: textControllerField1,
                      decoration: InputDecoration(
                          hintText: 'input value', suffixText: selectedField1),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: textControllerField2,
                      decoration: InputDecoration(
                          hintText: 'input value', suffixText: selectedField2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
