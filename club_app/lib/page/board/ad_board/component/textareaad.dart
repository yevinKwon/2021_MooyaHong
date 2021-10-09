import 'package:flutter/material.dart';
//To 홍보게시물 작성
class CustomTextAreaad extends StatelessWidget {
  
  final String hint;
  final funValidator;

  const CustomTextAreaad({required this.hint, required this.funValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 8,
        validator: funValidator,
        decoration: InputDecoration(
          hintText:"Enter $hint",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            ),
          ),
      ),
    );
  }
}