import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_demo/models/CounterModel.dart';
import 'package:state_managment_demo/screens/SecondaryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State Management Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("State Managemet"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<CounterModel>(
                builder: (context, counterModelObject, child) {
                  return Text(
                    "${counterModelObject.readCounter()}",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                  );
                },
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondaryPage(),
                      ),
                    );
                  },
                  child: Text(
                    "switch",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                width: 120,
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
