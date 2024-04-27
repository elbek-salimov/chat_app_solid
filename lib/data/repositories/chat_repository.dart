import '../models/contact_model.dart';
import '../models/message_model.dart';

class ChatRepository{
  List<MessageModel> allMessages = [
    MessageModel(
      createdTime: "2024-03-25 20:41:11.366752",
      messageText: "Vazifa nima bo'ldi alisher?",
      messageId: 1,
      isFile: false,
      contactId: 1,
      status: true,
    ),
    MessageModel(
      createdTime: "2024-04-20 20:41:11.366752",
      messageText: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      messageId: 2,
      isFile: true,
      contactId: 2,
      status: true,//o'qilganmi yoki o'qilmaganmi
    ),
    MessageModel(
      createdTime: "2024-09-17 20:41:11.366752",
      messageText: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      messageId: 3,
      isFile: true,
      contactId: 3,
      status: true,//o'qilganmi yoki o'qilmaganmi
    ),
    MessageModel(
      createdTime: "2024-05-29 20:41:11.366752",
      messageText: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      messageId: 4,
      isFile: true,
      contactId: 4,
      status: true,//o'qilganmi yoki o'qilmaganmi
    ),
    MessageModel(
      createdTime: "2024-06-10 20:41:11.366752",
      messageText: "Lorem Ipsum",
      messageId: 5,
      isFile: false,
      contactId: 5,
      status: true,//o'qilganmi yoki o'qilmaganmi
    ),
  ];

  List<ContactModel> allContacts = [
    ContactModel(
      contactId: 1,
      contactLastName: "Alisher",
      contactFirstName: "Falonchiyev",
      isOnline: true,
      imageUrl: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      lastOnlineTime: DateTime.now(),
    ),
    ContactModel(
      contactId: 2,
      contactLastName: "Bekzod",
      contactFirstName: "Shermatov",
      isOnline: false,
      imageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww",
      lastOnlineTime: DateTime.now(),
    ),
    ContactModel(
      contactId: 3,
      contactLastName: "John",
      contactFirstName: "Doe",
      isOnline: false,
      imageUrl: "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
      lastOnlineTime: DateTime.now(),
    ),
    ContactModel(
      contactId: 4,
      contactLastName: "Alice",
      contactFirstName: "Martin",
      isOnline: true,
      imageUrl: "https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg",
      lastOnlineTime: DateTime.now(),
    ),
    ContactModel(
      contactId: 5,
      contactLastName: "Nurbek",
      contactFirstName: "Asliddinov",
      isOnline: true,
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg",
      lastOnlineTime: DateTime.now(),
    ),
  ];
}
