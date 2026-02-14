import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goldapp/core/app_strings.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/marquee_text.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/monye3.jpg',
    'assets/monye.jpg',
    'assets/dollar1.avif',
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final isFa = context.watch<LocaleProvider>().isPersian;
    return Scaffold(

      body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(51, 54, 61, 1),
            child: Column(
              children: [
                const SizedBox(height: 16),

                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: _images.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(_images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _images.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  color: Colors.black38,
                  child:  Center(
                    child: MarqueeText(
                      text: (AppStrings.of('by trading bitcoin and etc get rich', isFa)),style: TextStyle(color: Colors.white70 , fontFamily: 'vazir'),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: GridView.count(
                crossAxisSpacing: 12,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1, // مربع
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.currency_bitcoin , color: Colors.white, size: 40,),
                          Text( AppStrings.of('bitcoin deal', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 10 , fontFamily: 'vazir'),)
                        ],
                      ),
                    ),
                      ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.airplanemode_active, color: Colors.white, size: 40,),
                          Text(AppStrings.of('airplan ticket', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 10 , fontFamily: 'vazir'),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people_alt , color: Colors.white, size: 40,),
                          Text(AppStrings.of('investment', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 10 , fontFamily: 'vazir'),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: GridView.count(
                    crossAxisSpacing: 12,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1, // مربع
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.monetization_on , color: Colors.white, size: 40,),
                              Text(AppStrings.of('dealing pay', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 10 , fontFamily: 'vazir'),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.waterfall_chart , color: Colors.white, size: 40,),
                              Text(AppStrings.of('trading', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 10 , fontFamily: 'vazir'),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.table_chart_rounded , color: Colors.white, size: 40,),
                              Text(AppStrings.of('market cap', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 10 , fontFamily: 'vazir'),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


            ],
            ),
          )),
    );
  }
}
