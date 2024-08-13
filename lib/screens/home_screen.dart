import 'dart:ui';

import 'package:calculator/widget/calculator_btn.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/expression.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   List buttons=['9','8','7','/',
                  '6','5','4','-',
                  '3','2','1','*',
                  'C','0','=','+'];
   String output="";
   String math_exp="";

  // void onButtonPress(data) {
  //   print(data);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text('Calculator'),
      ),
      // body: Column(
      //   children: [
      //     CalculatorButton(label: '9', color: Colors.red),
      //     CalculatorButton(label: '8',),
      //     CalculatorButton(label: '7', color:Colors.purple),
      //   ],
      // ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 300,
              alignment: Alignment.bottomRight,
              child: Text(output, style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return CalculatorButton(color: Colors.purple,label: buttons[index], callback: (label){
                      if(label=='='){
                        //calculate gara
                        Expression exp = Expression(math_exp);
                        setState(() {
                          output=exp.eval().toString();
                          math_exp='';
                          // print(math_exp);
                        });
                        // print("generate output"+ label);
                      }else if(label=='+' || label=='-' ||label=='*' || label=='/'){
                        setState(() {
                          output='';
                          math_exp=math_exp+label;
                        });
                        print("operation button is pressed"+label);
                      }else if(label=='C'){
                        output='';
                      } else{
                        if(math_exp==''){
                          output='';
                        }
                        setState(() {
                          output=output+label;
                          math_exp=math_exp+label;
                        });
                        // print("Number button is pressed"+label);
                      }
                      print("math exp = " + math_exp);
                    });
                  }),
            )

          ],
        ),
      ),

    );
  }
}
// Container(
// color: Colors.blue,
// margin: EdgeInsets.all(10),
// child: Center(
// child: Text(buttons[index],style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 38
//
// ),),
// ),
// )
// GridView.builder(
// itemCount: buttonLabels.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
// itemBuilder: (context, index){
// return Container(
// color:Colors.red,
// margin: EdgeInsets.all(10),
// child: Center(
// child: Text(buttonLabels[index],style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 30
// ),),
// ),
// );
// }),
// GridView.count(
// crossAxisCount: 4,
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// children: [
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.red,
// ),
// ],),


