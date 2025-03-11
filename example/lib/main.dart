import 'package:contextmenu/contextmenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ContextMenuArea(
          builder: _buildMenu,
          child: Card(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Press somewhere for context menu.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenu(BuildContext context) {
    return [
      ListTile(
        title: Text('Option 1'),
        onTap: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Whatever'),
            ),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.model_training),
        title: Text('Option 2'),
        onTap: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Foo!'),
            ),
          );
        },
      ),
    ];
  }
}
