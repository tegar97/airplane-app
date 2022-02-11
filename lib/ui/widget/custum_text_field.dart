import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustumTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsecure;
  const CustumTextFormField({Key? key,required this.title,required this.hintText,this.obsecure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obsecure,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(color: kPrimaryColor)),
            ),
          )
        ],
      ),
    );
  }
}
