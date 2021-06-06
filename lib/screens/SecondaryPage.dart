import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_demo/models/CounterModel.dart';

class SecondaryPage extends StatefulWidget {
  const SecondaryPage({Key? key}) : super(key: key);

  @override
  _SecondaryPageState createState() => _SecondaryPageState();
}

class _SecondaryPageState extends State<SecondaryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("State Managemet Page 2"),
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
              }),
              SizedBox(
                child: Consumer<CounterModel>(
                    builder: (context, counterModelObject, child) {
                  return ElevatedButton(
                    onPressed: () {
                      counterModelObject.increaseCounter();
                    },
                    child: Text(
                      "increase counter",
                      style: TextStyle(fontSize: 25),
                    ),
                  );
                }),
                width: 270,
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Consumer<CounterModel>(
                  builder: (context, counterModelObject, child) {
                    return ElevatedButton(
                      onPressed: () {
                        counterModelObject.decreaseCounter(2);
                      },
                      child: Text(
                        "decrease counter",
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  },
                ),
                width: 270,
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
