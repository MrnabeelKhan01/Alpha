import 'package:alpha/configurations/frontend_configs.dart';
import 'package:alpha/models/followers.dart';
import 'package:alpha/models/message_card.dart';
import 'package:flutter/material.dart';

import '../models/drawer.dart';
import '../models/event.dart';

class Utils {
  static List<FollowerModel> followerList = [
    FollowerModel(
        name: "mitchell.cooper",
        logo: "assets/images/facebook_logo.png",
        socialMedia: "Facebook",
        followers: "353,49K"),
    FollowerModel(
        name: "@mitchell.cooper",
        logo: "assets/images/insta_logo.png",
        socialMedia: "Instagram",
        followers: "753,90K"),
    FollowerModel(
        name: "mitchell.cooper",
        logo: "assets/images/facebook_logo.png",
        socialMedia: "Facebook",
        followers: "353,49K"),
  ];
  static List<DrawerModel> drawerList=[
    DrawerModel(icon: "assets/icons/drawer_icons/overview_icon.png", label: "OverView"),
    DrawerModel(icon: "assets/icons/drawer_icons/cart_icon.svg", label: "E-Commerce"),
    DrawerModel(icon: "assets/icons/drawer_icons/calender_icon.svg", label: "Calender"),
    DrawerModel(icon: "assets/icons/drawer_icons/mail_icon.svg", label: "Mail"),
    DrawerModel(icon: "assets/icons/drawer_icons/chat_icon.svg", label: "Chat"),
    DrawerModel(icon: "assets/icons/drawer_icons/task_icon.svg", label: "Tasks"),
    DrawerModel(icon: "assets/icons/drawer_icons/project_icon.svg", label: "Projects"),
    DrawerModel(icon: "assets/icons/drawer_icons/file_manager.svg", label: "File Manager"),
    DrawerModel(icon: "assets/icons/drawer_icons/notes_icon.svg", label: "Notes"),
    DrawerModel(icon: "assets/icons/drawer_icons/contact_icon.svg", label: "Contacts"),
  ];
  static List<MessageCardModel> messagePinnedList=[
    MessageCardModel(name: 'Alphaboard', message: 'Jane: Hello, Mark! I am wr...', avatar: 'assets/images/avatar_six.png'),
    MessageCardModel(name: 'Design Team', message: 'You: Hello. Can you drop t...', avatar: 'assets/images/avatar_five.png'),
    MessageCardModel(name: 'Dustin Williamson', message: 'Dustin is typing...', avatar: 'assets/images/avatar_one.png'),
  ];
  static List<MessageCardModel> allMessageList=[
    MessageCardModel(name: 'Jane Wilson', message: "Jane: Hi! How are you, Steve? 😃", avatar: 'assets/images/avatar_three.png'),
    MessageCardModel(name: 'Brandon Pena', message: 'How about going somew...', avatar: 'assets/images/avatar_two.png'),
    MessageCardModel(name: 'Nathan Fox', message: 'Hello. We have a meeting... ', avatar: 'assets/images/avatar_four.png'),
    MessageCardModel(name: 'Jacob Hawkins', message: 'Well done!', avatar: 'assets/images/avatar_five.png'),
    MessageCardModel(name: 'Alphaboard', message: 'Jane: Hello, Mark! I am wr...', avatar: 'assets/images/avatar_six.png'),
  ];
  List<Event> upcomingEvents = [
    Event(
      title: 'Brandbook and Guidebook',
      subtitle: 'Design',
      times: ['07:00', '07:30', '08:00'], // 30-minute intervals
      accentColor:FrontendConfigs.kAppSecondaryColor,
      attendeeCount: 4,
    ),
    Event(
      title: 'Marketing Meeting',
      subtitle: 'Strategy',
      times: ['08:30', '09:00', '09:30'],
      accentColor: FrontendConfigs.kAppSecondaryColor,
      attendeeCount: 10,
    ),
    Event(
      title: 'Product Launch',
      subtitle: 'Presentation',
      times: ['10:00', '10:30', '11:00'],
      accentColor: Colors.green,
      attendeeCount: 20,
    ),
    Event(
      title: 'Product Launch',
      subtitle: 'Presentation',
      times: ['11:30', '12:00', '12:30'],
      accentColor: Colors.grey,
      attendeeCount: 20,
    ),
  ];
}
