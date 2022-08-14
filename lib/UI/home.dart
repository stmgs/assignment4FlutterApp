import 'package:assignment4/UI/LogIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assignment4/UI/bottonNavWidgets/newsScreen.dart';
import 'package:assignment4/UI/bottonNavWidgets/currentWeather.dart';
import 'package:assignment4/UI/bottonNavWidgets/todoScreen.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Widget> _widgetOptions =<Widget>[
  //   Dashboard(),
  // ];
  int _selectedIndex=0;
  PageController pageController=PageController();

  void _onItemTapped(int index){

    setState((){
      _selectedIndex=index;
    });
    pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "News"),
        BottomNavigationBarItem(icon: Icon(Icons.cloud),label: "Weather"),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "News"),
      ],

      ),
      body:
      PageView(
        controller: pageController,
        children: [
          Dashboard(),
          CurrentWeatherPage(),
          TodoScreen(),
          ],
        onPageChanged: (page) {
          setState((){
            _selectedIndex=page;
          });
        },
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: Text("Logout"),
      //     onPressed: () {
      //       FirebaseAuth.instance.signOut().then((value) {
      //         print("Signed Out");
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => const Login()));
      //       });
      //     },
      //   ),
      // ),
    );
  }
}
