import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_plate/utils/constants.dart';

// ignore: must_be_immutable
class Input extends StatefulWidget {
  String? hint;
  int? minLines;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  String? Function(String?)? onChangeText;
  TextEditingController? controller;
  FloatingLabelBehavior? floating;
  bool isDense;
  TextStyle? style;
  InputBorder? inputBorder;
  TextInputType? inputType;
  bool isPassword;
  EdgeInsets? contentPadding;
  Color? bgColor;
  double borderRadius;
  bool enabled;
  Icon? trailing;
  int? type;
  int? maxLength;
  Widget? prefix;
  bool? disabled;
  Input({
    Key? key,
    this.hint,
    this.validator,
    this.controller,
    this.onSaved,
    this.minLines,
    this.isPassword = false,
    this.floating,
    this.isDense = false,
    this.style,
    this.inputBorder,
    this.inputType,
    this.onChangeText,
    this.contentPadding,
    this.bgColor,
    this.borderRadius = 0.0,
    this.enabled = true,
    this.trailing,
    this.type = kInputTypeAll,
    this.maxLength = 0,
    this.prefix,
    this.disabled = false,
  }) : super(key: key);

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  final FocusNode _focusNode = FocusNode();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.bgColor ?? Colors.transparent, borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: TextFormField(
        maxLength: widget.maxLength! > 0 ? widget.maxLength : null,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'^0+')),
        ],
        readOnly: widget.disabled ?? false,
        enabled: widget.enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        minLines: widget.minLines ?? 1,
        maxLines: widget.minLines ?? 1,
        focusNode: _focusNode,
        keyboardType: widget.inputType,
        cursorColor: kColorPrimary,
        obscureText: showPassword,
        style: widget.style ?? Theme.of(context).textTheme.bodyLarge,
        onChanged: widget.onChangeText != null ? (val) => widget.onChangeText!(val) : null,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ?? EdgeInsets.zero,
          isDense: widget.isDense,
          floatingLabelBehavior: widget.floating ?? FloatingLabelBehavior.auto,
          hintText: widget.hint != null ? "${widget.hint}" : null,
          // labelText: widget.hint != null ? "${widget.hint}" : null,
          labelText: (widget.floating == FloatingLabelBehavior.never) ? null : widget.hint,
          hintStyle: const TextStyle(color: kColorTextGrey),
          alignLabelWithHint: true,
          labelStyle: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: _focusNode.hasFocus ? kColorPrimary : kColorTextSecondary),
          errorBorder: widget.inputBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
          focusedBorder: widget.inputBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(color: kColorPrimary),
              ),
          enabledBorder: widget.inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
          disabledBorder: widget.inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]!),
              ),
          border: widget.inputBorder ?? const UnderlineInputBorder(),
          suffixIcon:
              widget.isPassword ? InkWell(onTap: () => togglePassword(), child: _trailingIcon()) : widget.trailing,
          prefixIcon: widget.prefix,
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
        controller: widget.controller,
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }

  Icon _trailingIcon() {
    return Icon(
      showPassword ? Icons.visibility : Icons.visibility_off,
      color: Colors.grey[400],
    );
  }

  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}
