import 'package:color_combination/thirdPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Second Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Hello Welcome to Second page"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: AnimatedCrossFade(
                crossFadeState: Theme.of(context).brightness == Brightness.light
                ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
                firstChild: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text("Light Image"),
                    ),
                    Image.asset('assets/images/lightImage.jpg', width: 200,),
                  ],
                ),
                secondChild: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text("Dark Image"),
                    ),
                    Image.asset('assets/images/darkImage.jpg', width: 200,),
                  ],
                ),
                duration: Duration(milliseconds: 200),
              ),
            ),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>thirdPage()));
            },
            child: Text("Second BTN"),
          )
        ],
      ),
    );
  }
}
