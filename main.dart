//import 'package:flutter/cupertino.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';

abstract class TestAppColors {
  static const secondary = Color(0xff292929);
  static const accent = Colors.white70;
  static const music = Colors.red;
  static const friends = Colors.blue;
  static const chat = Colors.green;
  static const community = Colors.purple;
  static const text = Colors.white;
  static const secondaryText = Colors.grey;
  static const background = Color(0xff222222);
  static const avatarBorder = Colors.orangeAccent;
  static final shadow = Colors.black.withOpacity(0.1);
}

abstract class TestAppStrings {
  static const appbar = 'Your page';
  static const editBtLbl = 'Edit';
  static const logoutBtnLbl = 'Log out';
  static const categoryFriendsLbl = 'Friends';
  static const categoryMusicLbl = 'Music';
  static const categoryCommunityLbl = 'Communities';
  static const categoryChatLbl = 'Chat';
  static const headerPhotosLbl = 'Foto';
  static const headerNewsLbl = 'News';
}

abstract class TestAppMocks {
  static const name = 'Conor McGregor';
  static const status =
      'The face of the fight game, Mr. Whiskey @properwhiskey';
  static const feedContent =
      'Surprise! Surprise! M*ther***ker! The legend is coming back!';
  static const feedWhen = '27 mins ago';

  static const avatarPath =
      'https://s.mediasalt.ru/images/405/405574/foto_konora_makgregora_2.jpg';

  static const galleryImages = [
    'https://avatars.mds.yandex.net/i?id=f3720ad1f88045aee395daf1ce9843d340039fe7-3989655-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=1874e70f109d28c9b920d6499691012a9e604eb9-10619913-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=a821f2e7b8d4a827297236ed204c64842118735a-10809483-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=0ae0b61c8f356c89683e073912d43dca-3751671-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=caf6ccc86ca9020dae6b73064efcd44906636249-10877381-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=0d40b5164c90c6378123d7103f747161c9e8f49f-9863451-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=2a0000018e8972c112fd55cdd59219a18af1-1678092-fast-images&n=13',
    'https://avatars.mds.yandex.net/i?id=2a0000018e6f73b079be98287dd46e37aa39-213586-fast-images&n=13',
    'https://avatars.mds.yandex.net/i?id=708bc6377ff275e316101d6fb3158ffb4130cfad-12539473-images-thumbs&n=13',
  ];
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          TestAppStrings.appbar,
          style: TextStyle(color: TestAppColors.text),
        ),
        backgroundColor: TestAppColors.background,
        leading: const Icon(
          Icons.arrow_back,
          color: TestAppColors.accent,
        ),
      ),
      backgroundColor: TestAppColors.background,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MainPersonalDataSection(
                imgPath: TestAppMocks.avatarPath,
                name: TestAppMocks.name,
                status: TestAppMocks.status,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ControlButtonPanel(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: MainCategoriesPanel(),
            ),
            SizedBox(height: 20),
            CustomImageSlider(images: TestAppMocks.galleryImages),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: FeedList(
                items: [
                  FeedItem(
                    avatarPath: TestAppMocks.avatarPath,
                    name: TestAppMocks.name,
                    when: TestAppMocks.feedWhen,
                    content: TestAppMocks.feedContent,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomNavBar(background: TestAppColors.secondaryText),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final Color background;

  const CustomNavBar({required this.background, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        boxShadow: [
          BoxShadow(
              color: TestAppColors.shadow,
              offset: const Offset(0, -2),
              blurRadius: 2)
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icons.home,
            Icons.search,
            Icons.add_box,
            Icons.play_circle_rounded,
            Icons.settings,
          ]
              .map(
                (e) => Expanded(
                  child: Icon(
                    e,
                    color: TestAppColors.accent,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final bool showIcon;
  final String imgPath;

  const CustomCircleAvatar({
    required this.radius,
    required this.showIcon,
    required this.imgPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: radius * 2,
      child: Stack(
        children: [
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.purple,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(
                style: BorderStyle.solid,
                color: TestAppColors.avatarBorder,
                width: 2.5,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/pics/ava_conor.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showIcon)
            Positioned(
              right: 7,
              bottom: 7,
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: TestAppColors.secondaryText,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.edit,
                  size: 17,
                  color: TestAppColors.text,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MainPersonalDataSection extends StatelessWidget {
  final String imgPath;
  final String name;
  final String status;

  const MainPersonalDataSection({
    required this.imgPath,
    required this.name,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomCircleAvatar(
        radius: 60,
        showIcon: true,
        imgPath: imgPath, //TestAppMocks.avatarPath
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                color: TestAppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              status,
              style: const TextStyle(
                fontSize: 13,
                color: TestAppColors.secondaryText,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class ControlButtonPanel extends StatelessWidget {
  const ControlButtonPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            title: TestAppStrings.editBtLbl,
            background: TestAppColors.avatarBorder,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            title: TestAppStrings.logoutBtnLbl,
            background: TestAppColors.secondary,
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color? background;

  const CustomButton({required this.title, this.background, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(color: TestAppColors.text),
      ),
    );
  }
}

class MainCategoriesPanel extends StatelessWidget {
  const MainCategoriesPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomCard(
                  title: TestAppStrings.categoryFriendsLbl,
                  icon: Icons.people,
                  iconColor: TestAppColors.friends,
                  background: TestAppColors.secondary,
                  count: 2328),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CustomCard(
                  title: TestAppStrings.categoryMusicLbl,
                  icon: Icons.music_note,
                  iconColor: TestAppColors.music,
                  background: TestAppColors.secondary,
                  count: 1055),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomCard(
                  title: TestAppStrings.categoryCommunityLbl,
                  icon: Icons.people_alt,
                  iconColor: TestAppColors.community,
                  background: TestAppColors.secondary,
                  count: 87),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CustomCard(
                  title: TestAppStrings.categoryChatLbl,
                  icon: Icons.chat_bubble,
                  iconColor: TestAppColors.chat,
                  background: TestAppColors.secondary,
                  count: 99),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color? background;
  final int count;

  const CustomCard(
      {required this.title,
      required this.icon,
      required this.iconColor,
      required this.count,
      this.background,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title ($count)',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: TestAppColors.secondaryText,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: TestAppColors.text,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class CustomImageSlider extends StatelessWidget {
  final List<String> images;

  const CustomImageSlider({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Header(TestAppStrings.headerPhotosLbl),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              ...images.map(
                (e) => SizedBox(
                  height: 140,
                  width: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class FeedList extends StatelessWidget {
  final List<FeedItem> items;
  const FeedList({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(TestAppStrings.headerNewsLbl),
        const SizedBox(height: 15),
        ...items,
      ],
    );
  }
}

class FeedItem extends StatelessWidget {
  final String avatarPath;
  final String name;
  final String when;
  final String content;

  const FeedItem(
      {required this.avatarPath,
      required this.name,
      required this.when,
      required this.content,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomCircleAvatar(
              radius: 20,
              showIcon: false,
              imgPath: avatarPath,
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: TestAppColors.accent),
                ),
                const SizedBox(height: 5),
                Text(
                  when,
                  style: const TextStyle(color: TestAppColors.secondaryText),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(color: TestAppColors.text),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
/*@override
Widget build(BuildContext context) {
  return const SizedBox.shrink();
}*/
