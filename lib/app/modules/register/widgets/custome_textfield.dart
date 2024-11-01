import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final IconData? leadingIcon;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.controller,
    this.leadingIcon,
    this.isPassword = false,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isFocused ? Colors.black : Colors.grey[300]!;
    final iconColor = _isFocused ? Colors.black : Colors.grey[500]!;
    final inputColor = _isFocused ? Colors.black : Colors.grey[500]!;

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: borderColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: widget.leadingIcon != null
                      ? Icon(
                          widget.leadingIcon,
                          size: 20,
                          color: iconColor,
                        )
                      : null,
                ),
                if (widget.leadingIcon != null) const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    obscureText: widget.isPassword && _obscureText,
                    inputFormatters: [
                      if (widget.maxLength != null)
                        LengthLimitingTextInputFormatter(widget.maxLength),
                    ],
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    style: TextStyle(
                      color: inputColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: InputBorder.none,
                      suffixIcon: widget.isPassword
                          ? IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: iconColor,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              constraints: const BoxConstraints(),
                            )
                          : null,
                    ),
                    onChanged: widget.onChanged,
                    validator: widget.validator,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
