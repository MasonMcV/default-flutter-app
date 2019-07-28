import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      bloc: Bloc(),
      child: MaterialApp(title: 'Title', home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder<Object>(
            stream: bloc.itemCount,
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        bloc.addOne.add(1);
        debugPrint("The button was pressed :)");
      }),
    );
  }
}
