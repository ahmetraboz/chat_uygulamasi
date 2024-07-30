//get chat user info(userid)
//listen chat messages
//send new message

import 'package:chat_uygulamasi/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  List<MessageModel> chat = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage(bool isMyMessage) {
    setState(() {
      chat.insert(
          0,
          MessageModel(
            isMyMessage: isMyMessage,
            text: messageController.text,
            timestamp: DateTime.now(),
          ));
      messageController.clear();
    });
  }

  void sendRightMessage() {
    sendMessage(true);
  }

  void sendLeftMessage() {
    sendMessage(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chat.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: chat[index].isMyMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: const Color.fromARGB(255, 74, 215, 250),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        chat[index].text,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                  ),
                  onPressed: sendLeftMessage,
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: "Mesaj yazın...",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10))),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  onPressed: sendRightMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
