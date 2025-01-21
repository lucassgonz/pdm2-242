import 'package:app/custom_scaffold.dart';
import 'package:app/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const MyHomePage(title: 'App'),
        '/settings': (context)=> const SettingsPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;
  
  @override
  
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return CustomScaffold(
      title: "Exemplo de simple page",
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: _incrementCounter,
          heroTag: 'increment',
          tooltip: 'Increment',
          child: const Icon(Icons.add)
          ),
          const SizedBox(width: 16),
          FloatingActionButton(onPressed: _decrementCounter,
          heroTag: 'decrement',
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),)

        ],
       
      ) 
    );
  }
}
