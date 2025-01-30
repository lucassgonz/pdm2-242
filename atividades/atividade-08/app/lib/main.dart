import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/cart.dart';
import 'package:app/catalog.dart';
import 'package:app/custom_scaffold.dart';
import 'package:app/settings.dart';
import 'package:app/theme.dart';
import 'package:app/models/cart.dart';
import 'package:app/models/catalog.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => CatalogModel()), // Primeiro, cria o CatalogModel
        ChangeNotifierProvider(
          create: (context) => CartModel(catalog: context.read<CatalogModel>()), // Passa o catálogo ao criar CartModel
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      darkTheme: darkmode,
      theme: lightmode,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'App',
              isDarkMode: _isDarkMode,
              onThemeChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
        '/settings': (context) => SettingsPage(
              title: 'Settings Screen',
              isDarkMode: _isDarkMode,
              onThemeChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
        '/cart': (context) => MyCart(
              title: 'Cart Screen',
              isDarkMode: _isDarkMode,
              onThemeChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
        '/catalog': (context) => MyCatalog(
              title: 'Catalog Screen',
              isDarkMode: _isDarkMode,
              onThemeChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

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

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Feito por Lucas Gonzaga",
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
          FloatingActionButton(
            onPressed: _incrementCounter,
            heroTag: 'increment',
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _decrementCounter,
            heroTag: 'decrement',
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
