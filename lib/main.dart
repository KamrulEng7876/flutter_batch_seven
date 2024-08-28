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
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory App'),
        backgroundColor: Colors.greenAccent,
        titleSpacing: 10,
        //text space
        // centerTitle: true, //title center
        toolbarHeight: 60,
        //Appbar height
        toolbarOpacity: 1,
        //color garo kora text hide kora
        titleTextStyle: TextStyle(
            color: Colors.red,
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        actions: [
          IconButton(
              onPressed: () {
                final snackbar = SnackBar(content: Text('I ame comment!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                ;
              },
              icon: Icon(Icons.comment)),
          IconButton(
              onPressed: () {
                final snackbar = SnackBar(content: Text('I ame search!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                ;
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                final snackbar = SnackBar(content: Text('I ame setting!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                ;
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                final snackbar = SnackBar(content: Text('I ame email!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                ;
              },
              icon: Icon(
                Icons.email,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                final snackbar = SnackBar(content: Text('I ame favorite!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                ;
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      ),
      body: Center( 
        child: Column(
          children:[ ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.info, color: Colors.white), // Add your icon here
                    SizedBox(width: 10), // Space between icon and text
                    Text('This is a Snackbar with an icon!'),
                  ],
                ),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Code to undo the change.
                  },
                ),
              );
          
              // Show the Snackbar
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text('Show Snackbar with Icon'),
          ),
            
      ],
        ),

      ),

    );
  }
}
