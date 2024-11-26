import 'package:flutter/material.dart';
import 'package:newone/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewOne(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewOne>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<NewOne>(
              builder: (context, value, child) {
                return Text(
                  '${value.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            IconButton(
                onPressed: () {
                  provider.incere();
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  provider.reset();
                },
                icon: Icon(Icons.restore)),
            IconButton(
                onPressed: () {
                  provider.decre();
                },
                icon: Icon(Icons.subdirectory_arrow_left)),
          ],
        ),
      ),
    );
  }
}
