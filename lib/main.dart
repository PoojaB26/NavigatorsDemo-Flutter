import 'package:flutter/material.dart';


void main() {
  runApp(
      new MaterialApp(
        home: new Screen1(),
        routes: <String, WidgetBuilder> {
          '/screen1': (BuildContext context) => new Screen1(),
          '/screen2' : (BuildContext context) => new Screen2(),
          '/screen3' : (BuildContext context) => new Screen3(),
          '/screen4' : (BuildContext context) => new Screen4()
        },
      )
  );
}

class Screen1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("Screen1");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 1"),

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              Navigator.of(context).pushNamed('/screen2');
            } ,child: new Text("Push to Screen 2"),),
            new SizedBox(height: 10.0,),

            new RaisedButton(
              onPressed: (){
                print(Navigator.of(context).canPop().toString());
              },
              child: new Text("Can Pop"),),
            new SizedBox(height: 10.0,),

            new RaisedButton(
              onPressed: (){
                Navigator.of(context).maybePop();
              },
              child: new Text("Maybe Pop"),),
            new SizedBox(height: 10.0,),

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
              Navigator.of(context).pushNamed('/screen3');
            },
              child: new Text("Push to Screen 3"),),
            new SizedBox(height: 10.0,),


            new RaisedButton(onPressed:(){
              Navigator.of(context).pushNamed('/screen1');
            } ,child: new Text("Push to Screen 1 instead of Pop"),),
            new SizedBox(height: 10.0,),

            new RaisedButton(onPressed: () {
              String userName = "John Doe";
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new Screen5(userName)));
            },
              child: new Text("Push to Screen 5 using MaterialPageRoute"),),

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
            new SizedBox(height: 10.0,),


            new RaisedButton(
              onPressed: (){
                Navigator.of(context).maybePop();
              },
              child: new Text("Maybe Pop"),),
            new SizedBox(height: 10.0,),


            new RaisedButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/screen4');
              },
              child: new Text("Push Replacement Named"),),
            new SizedBox(height: 10.0,),


            new RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/screen4');
              },
              child: new Text("pop and Push Named"),),
            new SizedBox(height: 10.0,),


            new RaisedButton(
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil('/screen4', ModalRoute.withName('/screen1'));
               // Navigator.of(context).pushNamedAndRemoveUntil('/screen4', (Route<dynamic> route) => false);
              },
              child: new Text("Push Named and Remove Until"),),
            new SizedBox(height: 10.0,),


            new RaisedButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute( builder: (BuildContext context) => new Screen4()), ModalRoute.withName('/screen1'));
              },
              child: new Text("Push and Remove Until"),),
            new SizedBox(height: 10.0,),





            new RaisedButton(onPressed:(){
              Navigator.of(context).pushNamed('/screen4');
            } ,child: new Text("Push to Screen 4"),),
            new SizedBox(height: 10.0,),


            new RaisedButton(
              onPressed: (){
                Navigator.push(context, new PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return new Scaffold(
                        body: new Center(
                          child: new Container(
                              child: new Center(child: new Text('My PageRoute'))),
                        ),
                      );
                    },
                    transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
                      return new FadeTransition(
                        opacity: animation,
                        child: new RotationTransition(
                          turns: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                          child: child,
                        ),
                      );
                    }
                ));
              },
              child: new Text("Page Route Builder"),),


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
            new SizedBox(height: 10.0,),

            new RaisedButton(onPressed: ()async{
              String value = await Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new Center(
                      child: new GestureDetector(
                          child: new Text('OK'),
                          onTap: () { Navigator.pop(context, "Audio1"); }
                      ),
                    );
                  }
              )
              );
              print(value);

            },
              child: new Text("Return"),)

          ],
        ),
      ) ,
    );
  }
}


class Screen5 extends StatelessWidget {

  final String userName;
  Screen5(this.userName);
  @override
  Widget build(BuildContext context) {

    print("Screen5");


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 5"),
        automaticallyImplyLeading: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("Hi " + userName),
          ],
        ),
      ) ,
    );

  }
}
