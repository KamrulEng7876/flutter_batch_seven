import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//         backgroundColor: Colors.cyan,
//       ),
//     );
//   }
// }
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory App'),
        titleTextStyle: TextStyle(
            color: Colors.red,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.mail, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.message, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.red))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              onPressed: () {
                final snackBar = SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('This is a Snackbar with an icon!'),
                      ],
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Show Snackbar with Icon'),
            ),
            Text(
              'Counter :$counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            // backgroundColor: Colors.red,
            onPressed: () {
              counter += 2;
              print(counter);
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 24,
          ),
          FloatingActionButton(
            // backgroundColor: Colors.red,
            onPressed: () {
              counter -= 2;
              print(counter);
              setState(() {});
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
