// ignore_for_file: file_names

import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  static const routename ='/About';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),

        centerTitle: true,
            title: Text(
              "About",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            shape:
                const Border(bottom: BorderSide(color: Colors.red, width: 2)),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [
              SizedBox(height: 25,),
              Center(
                child: Text('Khwater demshqia',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            SizedBox(height: 25,),

              Column(children: [
                Text("ابلكيشن خواطر دمشقيه هو ابسط طريقه تطلب بيها اشها الاكلات من اصل الطعم الشامي في الاسكندريه من 2012 الان الاكل متعه فالمتعه دي لازم تكمل انك تطلبهاباسهل وابسط طريقه ممكنه حتتعرف علي اصنافنا وعروضنا الخاصه ,وتشوف الاسعار والخصومات وتطلب بكل سهوله كل الي نفسك فيه عشان يوصلك لحد باب بيتك بسرعه وفر وقتك واختار طلبك بكل سهوله اونلاين واعمل الاوردر بتاعك في ثواني.لاي مساعده ممكن تكلمنا علطول 16435 ختلاقينا في خدمتك علطول",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(":المميزات",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:200.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  
                    child: Column(children: [
                      Text("تشوف كل الاصناف والاسعار",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      Text("تتعرف علي عروضنا الخاصه",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      Text("تستفيد من خصومات حصريه  ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      Text("توفر وقتك وجهدك ورصيدك",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    //  Text("حتلاقي بيناتك متسجله بعد اول مره",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                        


                    ],),
                    
                    ),
                )
              ],)
            ],
          ),

      
    );
  }
}