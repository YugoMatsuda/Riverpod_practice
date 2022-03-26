import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/provider.dart';
import 'data/count_data.dart';

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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(titleProvider)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ref.watch(messageProvider)),
            Text(ref.watch(countDataProvider.state).state.count.toString()),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CountData countData = ref.watch(countDataProvider.state).state;
                    ref.read(countDataProvider.state).state = countData.copyWith(
                      count: countData.count + 1,
                      countUp:  countData.countUp + 1
                    );
                  },
                  child: const Icon(CupertinoIcons.plus),
                ),
                FloatingActionButton(
                  onPressed: () {
                    CountData countData = ref.watch(countDataProvider.state).state;
                    ref.read(countDataProvider.state).state = countData.copyWith(
                        count: countData.count - 1,
                        countDown:  countData.countDown - 1
                    );
                  },
                  child: const Icon(CupertinoIcons.minus),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(ref.watch(countDataProvider.state).state.countUp.toString()),
                Text(ref.watch(countDataProvider.state).state.countDown.toString()),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(countDataProvider.state).state = const CountData(
                count: 0,
                countUp: 0,
                countDown: 0
            );
          },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}



