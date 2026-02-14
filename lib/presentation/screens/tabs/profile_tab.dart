import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(51, 54, 61, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Profile" , style: TextStyle(fontSize: 30 , color: Colors.white),),
            
          ),
          Text("Comming soon" , style: TextStyle(color: Colors.white70),),
          SizedBox(height: 30,),
          Text(" ... بزودی" , style: TextStyle(color: Colors.white70),)
        ],
      )
    );

  }
}
