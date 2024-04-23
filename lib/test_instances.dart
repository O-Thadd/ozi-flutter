import 'package:flutter/material.dart';
import 'package:ozi_flutter/models/menu_data.dart';


import 'models/PairChat.dart';
import 'models/user.dart';

const User uiTestUser1 = User(
  userId: "userId",
  username: "Thadd",
  aviFg: 1,
  aviBg: 2,
  online: true,
  verified: true,
  gameState: "gameState",
);

const PairChat testChat1 = PairChat(
  "chat1",
  "Dimitri",
  "Alright. I'll check and get back to you. So I need to know what you think now",
  0,
  "yesterday",
  7,
  2,
  true,
  true,
);

const testChat2 = PairChat(
    "chat2",
    "Festus",
    "Whatsup? seen it yet?",
    0,
    "22/09/23",
    8,
    2,
    true,
    false);

const testChat3 = PairChat(
    "chat3",
    "Dan",
    "Haq Haq, shey i been tell you",
    0,
    "22/09/23",
    9,
    1,
    false,
    true);

const testChat4 = PairChat(
    "chat4",
    "Erasmus",
    "I'll someone time.",
    0,
    "02/09/23",
    10,
    3,
    false,
    false);

List<PairChat> testPairChats1 = [testChat1, testChat2, testChat3, testChat4];


MenuData groupGameMenuItem = MenuData(
    "New Group Game",
        () {},
    Icons.groups
);

MenuData developerMenuItem = MenuData(
    "Developer",
        () {},
    Icons.computer
);

MenuData privacyPolicyMenu = MenuData(
    "Privacy Policy",
        () {},
    Icons.privacy_tip_outlined
);

MenuData logOutMenuItem = MenuData(
    "Log out",
        () {},
    Icons.logout
);

List<MenuData> menus = [groupGameMenuItem, developerMenuItem, privacyPolicyMenu, logOutMenuItem];