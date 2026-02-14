import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldapp/core/app_strings.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import '../../../data/datasources/gold-api-datasource.dart';
import '../../../data/models/gold-api-items.dart';
import '../../../data/models/gold-api-model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';


class goldtab extends StatefulWidget {
  const goldtab({super.key});

  @override
  State<goldtab> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<goldtab> {

  Future<List> _refresh(){

    return Future.delayed(Duration(seconds: 1));


  }

  @override
  Widget build(BuildContext context) {

    final auth = context.watch<AuthProvider>();
    final isFa = context.watch<LocaleProvider>().isPersian;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(



        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(51, 54, 61, 1),
          child: FutureBuilder<MarketResponse>(
            future: ApiService.fetchMarketData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context , index){

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Container(
                                      width: 160,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.red ,
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Container(
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.red ,
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          );

                        }),
                  ),
                );
              }

              final data = snapshot.data!;
              return ListView(
                children: [
                  sectionTitle(AppStrings.of('currency', isFa)),
                  marketList(data.gold),

                  sectionTitle(AppStrings.of('currency', isFa)),
                  marketList(data.crypto),

                ],
              );
            },
          ),
        ),

      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold , fontFamily: 'vazir' , color: Colors.white),
              ),
            ),


          ],
        )
    );
  }

  Widget marketList(List<MarketItem> items) {
    return Column(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  title: Text(item.name , style: TextStyle(fontSize: 18 , fontFamily: 'vazir' , fontWeight: FontWeight.w600 ,color: Colors.white),),
                  subtitle: Text(item.symbol , style: TextStyle(color: Colors.white30),),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${item.price} ${item.unit}",
                        style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 14 , fontFamily: 'vazir' , color: Colors.white),
                      ),
                      Text(
                        "${item.changePercent}%",
                        style: TextStyle(
                          color: item.changePercent >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 13 ,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList()
    );
  }
}






