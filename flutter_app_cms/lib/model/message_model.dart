import 'package:flutter_app_cms/model/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User bao = User(
  id: 1,
  name: 'Bao',
  imageUrl: 'assets/images/greg.jpg',
);
final User nhan = User(
  id: 2,
  name: 'Nhan',
  imageUrl: 'assets/images/james.jpg',
);
final User nghia = User(
  id: 3,
  name: 'Nghia',
  imageUrl: 'assets/images/john.jpg',
);
final User an = User(
  id: 4,
  name: 'An',
  imageUrl: 'assets/images/olivia.jpg',
);
final User phuong = User(
  id: 5,
  name: 'Phuong',
  imageUrl: 'assets/images/sam.jpg',
);
final User phuonganh = User(
  id: 6,
  name: 'Phuong Anh',
  imageUrl: 'assets/images/sophia.jpg',
);
final User han = User(
  id: 7,
  name: 'Han',
  imageUrl: 'assets/images/steven.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [bao, nhan, nghia, phuong, phuonganh];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: nhan,
    time: '5:30 PM',
    text: 'Hey, Mày đang đi đâu thế ? Hôm nay làm cái gì?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: an,
    time: '4:30 PM',
    text: 'Hey, Mày đang đi đâu thế ? Hôm nay làm cái gì?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nghia,
    time: '3:30 PM',
    text: 'Hey, Mày đang đi đâu thế? Hôm nay làm cái gì?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: phuonganh,
    time: '2:30 PM',
    text: 'Hey, Mày đang đi đâu thế? Hôm nay làm cái gì?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: han,
    time: '1:30 PM',
    text: 'Hey, Mày đang đi đâu thế? Hôm nay làm cái gì??',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: phuong,
    time: '12:30 PM',
    text: 'Hey, Mày đang đi đâu thế? Hôm nay làm cái gì??',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: bao,
    time: '11:30 AM',
    text: 'Hey, Mày đang đi đâu thế? Hôm nay làm cái gì??',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: nhan,
    time: '5:30 PM',
    text: 'Hey, Mày đang đi đâu thế? Hôm nay làm cái gì?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Chỉ là dẫn chó của t đi chơi thoi . ahi hi do ngoc!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nhan,
    time: '3:45 PM',
    text: 'ke mm ?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nhan,
    time: '3:15 PM',
    text: 'tất cả là đồ ăn ',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! mày sẽ ăn cái gì ?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nhan,
    time: '2:00 PM',
    text: 't sẽ ăn tạp :)).',
    isLiked: false,
    unread: true,
  ),
];
