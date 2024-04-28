import 'package:chat_app_solid/data/models/message_model.dart';
import 'package:chat_app_solid/data/repositories/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/size/app_size.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen(
      {super.key, required this.contactName, required this.contactId});

  final String contactName;
  final int contactId;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          contactName,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.read<ChatRepository>().allMessages.length,
              itemBuilder: (context, index) {
                MessageModel messages =
                    context.read<ChatRepository>().allMessages[index];
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 8.w, right: 8.w, top: 20.h, bottom: 5.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Text(messages.messageText),
                          ),
                          const Text('1 days ago',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_horiz, color: Colors.grey),
                    8.getW()
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5.w, right: 5.w),
                      hintText: 'Message',
                      filled: true,
                      fillColor: Colors.lightBlueAccent.withOpacity(0.2),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
