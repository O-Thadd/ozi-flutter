import 'package:flutter/material.dart';
import 'package:ozi_flutter/models/PairChat.dart';
import 'package:ozi_flutter/models/menu_data.dart';
import 'package:ozi_flutter/models/user.dart';
import 'package:ozi_flutter/ozi_widgets.dart';
import 'package:ozi_flutter/test_instances.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.thisUser,
      required this.chats,
      required this.inDarkMode,
      required this.toggleTheme});

  final User thisUser;
  final List<PairChat> chats;
  final bool inDarkMode;
  final void Function() toggleTheme;

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool menuDisplayed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.surface,
              child: TopBar(
                user: widget.thisUser,
                inDarkMode: widget.inDarkMode,
                toggleTheme: widget.toggleTheme,
                toggleMenuVisibility: () {
                  setState(() {
                    menuDisplayed = !menuDisplayed;
                  });
                },
              ),
            ),
            Expanded(
              child: widget.chats.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: widget.chats.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Chat(
                                key: ObjectKey(widget.chats[index].chatId),
                                chat: widget.chats[index]),
                            const SizedBox(height: 12),
                          ],
                        );
                      },
                    )
                  : Image.asset('assets/images/ozi empty state.png'),
            ),
            // const Chat(chat: testChat1)
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, right: 16),
            child: AnimatedSlide(
              offset: menuDisplayed ? Offset.zero : const Offset(0, -5),
              duration: const Duration(milliseconds: 300),
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: menus.length,
                    itemBuilder: (context, index) {
                    var menu = menus[index];
                    return MenuItem(key: ObjectKey(menu.name), menuData: menu,);
                }),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch(
      {super.key,
      required this.width,
      required this.inDarkMode,
      required,
      required this.onToggle});

  final double width;
  final bool inDarkMode;
  final Function() onToggle;

  @override
  State<StatefulWidget> createState() {
    return _ThemeSwitchState();
  }
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  void toggleMode() {
    setState(() {
      widget.onToggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width;
    return GestureDetector(
      onTap: toggleMode,
      child: AnimatedContainer(
        width: width,
        height: width / 1.6,
        padding: EdgeInsets.all(width / 12.5),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1C55FC), width: width / 25),
          borderRadius: BorderRadius.circular(width / 2),
          color: Theme.of(context).colorScheme.surface,
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedAlign(
          alignment:
              widget.inDarkMode ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: EdgeInsets.all(width / 24),
            decoration: BoxDecoration(
              color: const Color(0xFF000146),
              borderRadius: BorderRadius.circular(width / 5),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: widget.inDarkMode
                  ? MoonImage(size: width / 3.3)
                  : SunImage(size: width / 3.3),
            ),
          ),
        ),
      ),
    );
  }
}

class SunImage extends StatelessWidget {
  const SunImage({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage('assets/images/sun.png'),
      color: Colors.white,
      size: size,
    );
  }
}

class MoonImage extends StatelessWidget {
  const MoonImage({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage('assets/images/moon.png'),
      color: Colors.white,
      size: size,
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar(
      {super.key,
      required this.user,
      required this.inDarkMode,
      required this.toggleTheme,
      required this.toggleMenuVisibility});

  final User user;
  final bool inDarkMode;
  final void Function() toggleTheme;
  final void Function() toggleMenuVisibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avi(size: 50, fg: user.aviFg, bg: user.aviBg),
        const SizedBox(width: 10),
        Text(
          user.username,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(width: 8),
        Visibility(
            visible: user.verified,
            child: Icon(
              Icons.verified,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            )),
        const Expanded(child: SizedBox()),
        ThemeSwitch(width: 60, inDarkMode: inDarkMode, onToggle: toggleTheme),
        const SizedBox(width: 10),
        GestureDetector(
            onTap: toggleMenuVisibility,
            child: const Icon(Icons.more_vert_rounded)),
      ],
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key, required this.chat});

  final PairChat chat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avi(size: 40, fg: chat.aviFg, bg: chat.aviBg),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    chat.chatName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 8),
                  Visibility(
                      visible: chat.verified,
                      child: Icon(
                        Icons.verified,
                        color: Theme.of(context).colorScheme.primary,
                      ))
                ],
              ),
              Text(
                chat.lastMessage,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
                visible: chat.hasUnreadMessage,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                )),
            Visibility(
                visible: chat.hasUnreadMessage,
                child: const SizedBox(
                  height: 8,
                )),
            Text(chat.lastMessageDateTime,
                style: Theme.of(context).textTheme.labelMedium)
          ],
        )
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.menuData});

  final MenuData menuData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(menuData.icon, color: Theme.of(context).colorScheme.primary,),
        const SizedBox(width: 8,),
        Text(menuData.name, style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }

}
