import 'package:flutter/material.dart';
import 'package:sneakerz/pages/home/chat_pages.dart';
import 'package:sneakerz/pages/home/home_pages.dart';
import 'package:sneakerz/pages/home/profile_pages.dart';
import 'package:sneakerz/pages/home/wishlist_pages.dart';
import 'package:sneakerz/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Image.asset(
          'assets/Cart_Icon.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: bgColor4,
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                  print(value);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/Home_Icon.png',
                      width: 20,
                      color:
                          _currentIndex == 0 ? primaryColor : notSelectedColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/Chat_Icon.png',
                      width: 20,
                      color:
                          _currentIndex == 1 ? primaryColor : notSelectedColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/Love_Icon.png',
                      width: 20,
                      color:
                          _currentIndex == 2 ? primaryColor : notSelectedColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/Prof_Icon.png',
                      width: 18,
                      color:
                          _currentIndex == 3 ? primaryColor : notSelectedColor,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (_currentIndex) {
        case 0:
          return HomePage();

        case 1:
          return ChatPage();

        case 2:
          return WishlistPage();

        case 3:
          return ProfilePage();

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: _currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
