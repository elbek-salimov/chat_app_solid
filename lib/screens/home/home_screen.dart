import 'package:chat_app_solid/data/repositories/chat_repository.dart';
import 'package:chat_app_solid/screens/home/chat_screen.dart';
import 'package:chat_app_solid/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../data/models/contact_model.dart';
import '../../utils/size/app_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Conversations',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.addChat),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90.h,
            child: ListView(
              padding: EdgeInsets.only(left: 24.w),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 16.w),
                        height: 56.h,
                        width: 56.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.w),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(Icons.add,
                            color: Colors.grey.withOpacity(0.6)),
                      ),
                    ),
                    4.getH(),
                    SizedBox(
                      width: 56.h,
                      child: const Text(
                        'Your Story',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                ...List.generate(
                  context.read<ChatRepository>().allContacts.length,
                  (index) {
                    ContactModel contacts =
                        context.read<ChatRepository>().allContacts[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 56.h,
                            width: 56.h,
                            margin: EdgeInsets.only(right: 16.w),
                            padding: EdgeInsets.all(2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFD84D4D).withOpacity(0.20),
                                  const Color(0xFFD84D4D),
                                ])),
                            child: Container(
                              padding: EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  contacts.imageUrl,
                                  fit: BoxFit.cover,
                                  // height: 60.w,
                                  // width: 60.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        4.getH(),
                        SizedBox(
                          width: 56.h,
                          child: Text(
                            contacts.contactFirstName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            height: 1.h,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ...List.generate(
                  context.read<ChatRepository>().allContacts.length,
                  (index) {
                    ContactModel contacts =
                        context.read<ChatRepository>().allContacts[index];
                    return Container(
                      height: 48.h,
                      width: 48.h,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                contactName: contacts.contactFirstName,
                                contactId: contacts.contactId,
                              ),
                            ),
                          );
                        },
                        leading: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              height: 48.h,
                              width: 48.h,
                              child: Image.network(
                                contacts.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: contacts.isOnline,
                            child: Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 13.h,
                                width: 13.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Colors.white, width: 1.h)),
                              ),
                            ),
                          )
                        ]),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              contacts.contactFirstName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.jm().format(contacts.lastOnlineTime),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(contacts.contactId.toString()),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
