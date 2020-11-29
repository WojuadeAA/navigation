import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  @override
  _GratitudeState createState() => _GratitudeState();
  final int radioGroupValue;

  Gratitude({Key key, @required this.radioGroupValue}) : super(key: key);
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = List();
  String _selectedGratitude;

  int _radioGroupValue;

  @override
  void initState() {
    super.initState();
    _gratitudeList.add('Family');
    _gratitudeList.add('Friends');
    _gratitudeList.add('Coffee');

    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (value) => _radioOnChanged(value),
              ),
              Text(_gratitudeList[0]),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (value) => _radioOnChanged(value),
              ),
              Text('Friends'),
              Radio(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (value) => _radioOnChanged(value),
              ),
              Text('Cofee'),
            ],
          ),
        ),
      ),
    );
  }

  _radioOnChanged(int value) {
    setState(() {
      _radioGroupValue = value;
      _selectedGratitude = _gratitudeList[value];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }
}
