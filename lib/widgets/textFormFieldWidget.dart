import 'package:flutter/material.dart';
import '../constants/constants.dart' as Constants;
import '../constants/regex.dart' as Regx;

void main() {
  runApp(TextFormFieldWidget());
}

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  emptyValidate - empty value to validate
/// *  regxValidate - regx value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType textInputType;
  final String hintText;
  final String labelText;
  final Widget prefixIcon;
  final String defaultText;
  final FocusNode focusNode;
  final bool obscureText;
  final TextEditingController controller;
  final Function functionValidate;
  final String emptyValidate;
  final String regxValidate;
  final TextInputAction actionKeyboard;
  final Function onSubmitField;
  final Function onFieldTap;
  final int maxLength;
  final double radius;
  final Color focusedBorderColor;
  final Color enabledBorderColor;

  const TextFormFieldWidget(
      {@required this.hintText,
      this.labelText,
      this.maxLength,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.obscureText = false,
      this.controller,
      this.functionValidate,
      this.emptyValidate,
      this.regxValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon,
      this.radius,
      this.focusedBorderColor,
      this.enabledBorderColor});

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 20;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.white,
      ),
      child: Container(
        color: Colors.white,
        child: TextFormField(
          cursorColor: Colors.grey,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          keyboardType: widget.textInputType,
          textInputAction: widget.actionKeyboard,
          focusNode: widget.focusNode,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 1.2,
          ),
          initialValue: widget.defaultText,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.enabledBorderColor ?? Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: widget.enabledBorderColor ?? Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.enabledBorderColor ?? Colors.grey),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.focusedBorderColor ?? Colors.amber[600]),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            contentPadding: EdgeInsets.only(
                top: 20, bottom: bottomPaddingToError, left: 15.0, right: 15.0),
            isDense: true,
            errorStyle: TextStyle(
              color: Colors.red,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          controller: widget.controller,
          validator: (value) {
            if (widget.functionValidate != null) {
              String resultValidate = widget.functionValidate(
                  value, widget.emptyValidate, widget.regxValidate);
              if (resultValidate != null) {
                return resultValidate;
              }
            }
            return null;
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmitField != null) widget.onSubmitField();
          },
          onTap: () {
            if (widget.onFieldTap != null) widget.onFieldTap();
          },
        ),
      ),
    );
  }
}

String commonValidation(String value, String emptyError, String messageError) {
  var required = '';
  if (messageError == Constants.ERROR_INVALID_EMAIL) {
    required = requiredEmailValidator(value, emptyError, messageError);
  } else {
    required = requiredPwdValidator(value, emptyError, messageError);
  }

  if (required != null) {
    return required;
  }
  return null;
}

String requiredEmailValidator(value, emptyError, messageError) {
  if (value.isEmpty) {
    return emptyError;
  } else if (!(Regx.emailRegx.hasMatch(value))) {
    return messageError;
  }
  return null;
}

String requiredPwdValidator(value, emptyError, messageError) {
  if (value.isEmpty) {
    return emptyError;
  } else if (!(Regx.pwdRegx.hasMatch(value))) {
    return messageError;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
