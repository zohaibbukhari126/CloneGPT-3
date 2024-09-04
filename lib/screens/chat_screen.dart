import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_flutter/constants/constant.dart';

import 'package:hello_flutter/services/assets_manager.dart';
import 'package:hello_flutter/widgets/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.logo),
        ),
        title: const Text("Clone GPT-3",
            style: TextStyle(
              color: Colors.white, // Change this to your desired color
            )),
        backgroundColor: const Color(0xFF2F2F2F),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return  ChatWidget(
                    msg: chatMessages[index]["msg"].toString(),
                    chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
                  );  
                },
              ),
            ),
            if (_isTyping) ...[
              const SpinKitWave(
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            controller: textEditingController,
                            onSubmitted: (value) {
                              // TO DO message
                            },
                            decoration: InputDecoration.collapsed(
                              hintText: "Type a message",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(82, 255, 255, 255)),
                            )),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
