import 'package:flutter/material.dart';
import 'package:goldapp/core/app_strings.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';
import 'tabs/home_tab.dart';
import 'tabs/Investmenttab_tab.dart';
import 'tabs/gold_tab.dart';
import 'tabs/dollar_tab.dart';
import 'tabs/profile_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 2;

  final List<Widget> _pages = const [
    dollartab(),
    goldtab(),
    HomeTab(),
    Investmenttab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final isFa = context.watch<LocaleProvider>().isPersian;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(onPressed: (){
          _scaffoldKey.currentState?.openDrawer();
        }, icon: Icon(Icons.menu , color: Colors.white , size: 30,)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: ListView(
          children: [
            DrawerHeader(
              curve: Curves.easeInCirc,
                decoration: BoxDecoration(color: Colors.black12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(AppStrings.of('App-menu', isFa) , style: TextStyle(color: Colors.white , fontFamily: 'vazir' , fontSize: 25),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          context.read<ThemeProvider>().toggleTheme();
                        }, icon: Icon(context.watch<ThemeProvider>().isDark ? Icons.light_mode : Icons.dark_mode_outlined , size: 30, color: Colors.white,)),
                        Text(AppStrings.of('Dark & light mode', isFa) , style: TextStyle(color: Colors.white , fontSize: 20),)
                      ],
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded, size: 30 , color: Colors.white,),
              title:  Text(AppStrings.of('Avatar profile', isFa) , style: TextStyle(color: Colors.white , fontFamily: 'vazir'),),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, size: 30 , color: Colors.white,),
              title:  Text(AppStrings.of('Settings', isFa) , style: TextStyle(color: Colors.white , fontFamily: 'vazir'),),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.language, size: 30 , color: Colors.white,),
              title:  Text(AppStrings.of('language', isFa) , style: TextStyle(color: Colors.white , fontFamily: 'vazir'),),
              onTap: () {
                context.read<LocaleProvider>().toggleLocale();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, size: 30 , color: Colors.white,),
              title:  Text(AppStrings.of('Log-out', isFa) , style: TextStyle(color: Colors.white , fontFamily: 'vazir'),),
              onTap: () {},
            ),

          ],
        ),
      ),
      key: _scaffoldKey,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: AppStrings.of('dollar', isFa),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: AppStrings.of('currency', isFa),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.of('home', isFa),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: AppStrings.of('Investment', isFa),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.of('profile', isFa),
          ),
        ],
      ),
    );
  }
}
