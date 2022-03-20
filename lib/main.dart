import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
            builder: (context, ref, child) => Text(ref.watch(titleProvider))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) => Text(
          ref.watch(messageProvider)))
            ,
            Consumer(builder: (context, ref, child) => Text(
                ref.watch(countProvider).toString()))
          ],
        ),
      ),
      floatingActionButton: Consumer(builder: (context, ref, child) => FloatingActionButton(
        onPressed: () => ref.read(countProvider.state).state++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      )),
    );
  }
}
