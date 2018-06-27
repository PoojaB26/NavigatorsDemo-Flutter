import 'package:flutter/material.dart';

void main() { // 1
  runApp( // 2
      new MaterialApp( //3
        home: new Screen1(), //4
        routes: <String, WidgetBuilder> { //5
          '/screen1': (BuildContext context) => new Screen1(), //6
          '/screen2' : (BuildContext context) => new Screen2(),//7
          '/screen3' : (BuildContext context) => new Screen3(), //
          '/screen4' : (BuildContext context) => new Screen4() //7
// 7

        },
      )
  );
}

class Screen1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("Screen1");

    return new Scaffold( // 1
      appBar: new AppBar( //2
        title: new Text("Screen 1"),

      ),
      body: new Center( // 3
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              Navigator.of(context).pushNamed('/screen2');//4
            } ,child: new Text("Push to Screen 2"),),

            new RaisedButton(
              onPressed: (){
                print(Navigator.of(context).canPop().toString());
              },
              child: new Text("Can Pop"),),
            new RaisedButton(
              onPressed: (){
                Navigator.of(context).maybePop();
              },
              child: new Text("Maybe Pop"),),
            new RaisedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: new Text("Pop"),)
          ],
        ),
      ) ,
    );
  }
}

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print("Screen2");


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 2"),
        automaticallyImplyLeading: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed: () {
      Navigator.push(
      context,
      new MaterialPageRoute(
      builder: (BuildContext context) =>
      new Screen3()));
      },
          child: new Text("Push Screen 3"),)
          ],
        ),
      ) ,
    );

  }
}


class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print("Screen3");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 3"),

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           new RaisedButton(
               onPressed: (){
                 print(Navigator.of(context).canPop().toString());
               },
           child: new Text("Can Pop"),),

           new RaisedButton(
             onPressed: (){
               Navigator.of(context).maybePop();
             },
             child: new Text("Maybe Pop"),),

           new RaisedButton(
             onPressed: (){
               Navigator.of(context).pushReplacementNamed('/screen1');
             },
             child: new Text("Push Replacement Named"),),

           new RaisedButton(
             onPressed: (){
               Navigator.of(context).pushNamedAndRemoveUntil('/screen1', (Route<dynamic> route) => false);
             },
             child: new Text("Push Named and Remove Until"),),
           new RaisedButton(
             onPressed: (){
               Navigator.popAndPushNamed(context, '/screen1');
             },
             child: new Text("pop and Push Named"),),
           new RaisedButton(onPressed:(){
             Navigator.of(context).pushNamed('/screen4');
           } ,child: new Text("Push to Screen 4"),),
          ],
        ),
      ) ,
    );

  }
}


class Screen4 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("Screen4");

    return new Scaffold( // 1
      appBar: new AppBar( //2
        title: new Text("Screen 4"),

      ),
      body: new Center( // 3
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName('/screen2'));
              },
              child: new Text("popUntil"),),

          ],
        ),
      ) ,
    );
  }
}



void button2(BuildContext context){
  print("Button 2"); //3
  Navigator.of(context).pushNamed('/screen3');//4
}


void button3(BuildContext context){
  print("Button 3"); //3
  Navigator.removeRouteBelow(context,
    new MaterialPageRoute(
      builder: (context) {
        Screen3;
      },
    ),
  );
  Navigator.of(context).pop();
  //Navigator.of(context).pushNamedAndRemoveUntil('/screen1', (Route<dynamic> route) => false);//4
  //Navigator.of(context).pushNamed('/screen1'); //2

  //Navigator.of(context).pop();

}