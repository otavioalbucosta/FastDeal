import 'package:fast_deal/view/announcement_page.dart';
import 'package:fast_deal/view/homepage.dart';
import 'package:fast_deal/view/mydatapage.dart';
import 'package:flutter/material.dart';
import 'package:fast_deal/view/loginpage.dart';
import 'package:fast_deal/view/registerpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fast_deal/view/productpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  List<Widget> _pages = [HomePage(), AnnouncementPage(), mydatapage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            title: Text("Home",
                style: GoogleFonts.poppins(
                    color: _selectedIndex == 0 ? Colors.blue : Colors.grey)),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              title: Text("Anúncio",
                  style: GoogleFonts.poppins(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              title: Text("Perfil",
                  style: GoogleFonts.poppins(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.grey)))
        ],
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
