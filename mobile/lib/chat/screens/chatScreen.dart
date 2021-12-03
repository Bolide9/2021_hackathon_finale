import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/chat/models/ChatMessage.dart';
import 'package:flutter_rosseti_hack/font.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final List<ChatMessage> messages = [
    ChatMessage(messageContent: "Привет!", messageType: "receiver"),
    ChatMessage(messageContent: "Привет", messageType: "sender"),
    ChatMessage(messageContent: "Как сдал тест?", messageType: "receiver"),
    ChatMessage(messageContent: "Полный провал", messageType: "sender"),
    ChatMessage(messageContent: "Почему?", messageType: "receiver"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Иван Иванов',
            style: interFont(),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey.shade500,
            height: 0.3,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: messages[index].messageType == "receiver" ? Colors.white24 : Color.fromRGBO(31, 34, 40, 1),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                style: interFont(),
                decoration: InputDecoration(
                  hintText: "Сообщение...",
                  hintStyle: interFont(),
                  border: InputBorder.none,
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
