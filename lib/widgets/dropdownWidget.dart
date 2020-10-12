import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final double width;
  final double height;
  final Function onChanged;
  final List items;
  final bool filled;
  final Color fillColor;
  final String value;

  const DropDownWidget(
      {@required this.hintText,
      this.labelText,
      this.width,
      this.height,
      this.onChanged,
      this.items,
      this.filled,
      this.fillColor,
      this.value});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  double bottomPaddingToError = 12;
  Color primaryColor = Colors.green;
  Color colorBlack = Colors.black;
  Color colorRed = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: primaryColor,
      ),
      child: Container(
          width: widget.width,
          color: Colors.pink,
          height: widget.height,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                labelText: widget.labelText,
                filled: widget.filled,
                fillColor: widget.fillColor,
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                ),
                hintText: widget.hintText,
              ),
              value: widget.value,
              items: widget.items.map((value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (value) {
                if (widget.onChanged != null) widget.onChanged(value);
              },
            ),
          )),
    );
  }
}
