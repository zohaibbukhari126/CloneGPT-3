import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_flutter/constants/constant.dart';
import 'package:hello_flutter/services/assets_manager.dart';
import 'package:hello_flutter/widgets/text_widget.dart'; // Ensure this import is correct


class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex % 2 == 0 ? scaffoldBackgroundColor: cardColor, // Replace cardColor with a valid color
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex % 2 == 0 ? AssetsManager.peron: AssetsManager.logo,
                height: 30,
                width: 30),
                SizedBox(width: 6,),
                //Expanded is used as it allows text to use without giving the overflow error
               Expanded(child: TextWidget(label: msg))// Ensure this reference is correct
              ],
            ),
          ),
        ),
      ],
    );
  }
}