import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldapp/core/app_strings.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';

class Investmenttab extends StatelessWidget {
  const Investmenttab({super.key});

  @override
  Widget build(BuildContext context) {

    final auth = context.watch<AuthProvider>();
    final isFa = context.watch<LocaleProvider>().isPersian;
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height ,
        color: Color.fromRGBO(51, 54, 61, 1),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width - 30  ,
              height: 120 ,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 75 ,
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset('assets/aks1.png' ,),
                        ),
                      ),
      
                      Column(
                        children: [
                          Text(AppStrings.of('sherkat naft gostar', isFa),style: TextStyle(color: Colors.white , fontSize: 14 , fontFamily: 'vazir' , fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Row(
      
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800 , 
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('medeuim risk', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                              SizedBox(width: 7,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('sahami', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                            ],
                          )
                        ],
                      ),
      
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.doc_text_search ,size: 21, color: Colors.white,),
                              )),
                          SizedBox(height: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.xmark_seal_fill ,size: 21, color: Colors.white,),
                              ))
      
                        ],
                      )
                      
                    ],
                    
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 30  ,
              height: 120 ,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 75 ,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset('assets/aks2.png' ,),
                        ),
                      ),
      
                      Column(
                        children: [
                          Text(AppStrings.of('shrkat sakhre o hamyar', isFa),style: TextStyle(color: Colors.white , fontSize: 14 , fontFamily: 'vazir' , fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Row(
      
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('daramad sabet', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                              SizedBox(width: 7,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('sahami', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                            ],
                          )
                        ],
                      ),
      
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.doc_text_search ,size: 21, color: Colors.white,),
                              )),
                          SizedBox(height: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.xmark_seal_fill ,size: 21, color: Colors.white,),
                              ))
      
                        ],
                      )
      
                    ],
      
                  ),
      
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 30  ,
              height: 120 ,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 75 ,
      
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset('assets/aks4.png' , fit: BoxFit.cover,),
                        ),
                      ),
      
                      Column(
                        children: [
                          Text(AppStrings.of('nikokari hamyar', isFa),style: TextStyle(color: Colors.white , fontSize: 14 , fontFamily: 'vazir' , fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Row(
      
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('no risk', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                              SizedBox(width: 7,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('sahami', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                            ],
                          )
                        ],
                      ),
      
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.doc_text_search ,size: 21, color: Colors.white,),
                              )),
                          SizedBox(height: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.xmark_seal_fill ,size: 21, color: Colors.white,),
                              ))
      
                        ],
                      )
      
                    ],
      
                  ),
      
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 30  ,
              height: 120 ,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 75 ,
      
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset('assets/aks2.png' , fit: BoxFit.cover,),
                        ),
                      ),
      
                      Column(
                        children: [
                          Text(AppStrings.of('sherkat folad yekan', isFa),style: TextStyle(color: Colors.white , fontSize: 14 , fontFamily: 'vazir' , fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Row(
      
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('high risk', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                              SizedBox(width: 7,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('sahami', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                            ],
                          )
                        ],
                      ),
      
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.doc_text_search ,size: 21, color: Colors.white,),
                              )),
                          SizedBox(height: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.xmark_seal_fill ,size: 21, color: Colors.white,),
                              ))
      
                        ],
                      )
      
                    ],
      
                  ),
      
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 30  ,
              height: 120 ,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 75 ,
      
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset('assets/aks2.png' , fit: BoxFit.cover,),
                        ),
                      ),
      
                      Column(
                        children: [
                          Text(AppStrings.of('shrkat sakhre o hamyar', isFa),style: TextStyle(color: Colors.white , fontSize: 14 , fontFamily: 'vazir' , fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Row(
      
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('no risk', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                              SizedBox(width: 7,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('sahami', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                            ],
                          )
                        ],
                      ),
      
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.doc_text_search ,size: 21, color: Colors.white,),
                              )),
                          SizedBox(height: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.xmark_seal_fill ,size: 21, color: Colors.white,),
                              ))
      
                        ],
                      )
      
                    ],
      
                  ),
      
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 30  ,
              height: 120 ,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: 75 ,
      
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image.asset('assets/aks2.png' , fit: BoxFit.cover,),
                        ),
                      ),
      
                      Column(
                        children: [
                          Text(AppStrings.of('sherkat folad yekan', isFa),style: TextStyle(color: Colors.white , fontSize: 14 , fontFamily: 'vazir' , fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Row(
      
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('high risk', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                              SizedBox(width: 7,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800 ,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(AppStrings.of('sahami', isFa),style: TextStyle(color: Colors.white , fontSize: 11 , fontFamily: 'vazir'),),
                                  )),
                            ],
                          )
                        ],
                      ),
      
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.doc_text_search ,size: 21, color: Colors.white,),
                              )),
                          SizedBox(height: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.xmark_seal_fill ,size: 21, color: Colors.white,),
                              ))
      
                        ],
                      )
      
                    ],
      
                  ),
      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
