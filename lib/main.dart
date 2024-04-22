import 'package:money_wise/charts.dart';
import 'package:money_wise/home_page.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: "",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final List<Widget> _children = [
    const Report(),
    const HomePage(),
    const Login()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('MoneyWise'),
        centerTitle: true,
      ),
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedItemColor: Colors.orangeAccent,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'Записи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Добавить',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Я',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
