import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_seven/presentation/widgets/nev_menu.dart';

import '../widgets/deshboard_card.dart';
import '../widgets/responsib_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        mobaile: _buildMobaileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout());
  }

  Widget _buildMobaileLayout() {
    return Scaffold(
      appBar: AppBar(

          title: Text('HUMMING\nBIRD'),
          actions: [


          Text('Episodes',),
      SizedBox(width: 20,),
      Text('About'),],
        backgroundColor: Colors.pink,
      ),
      drawer: NevMenu(),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              Text(
                'FLUTTER WEB.\nTHE BASIC',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
        
              SizedBox(
                height: 8,
              ),
              Text(
                'This Flutter Tutorial is specifically designed for beginners and experienced professionals. It covers both the basics and advanced concepts of the Flutter framework.',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Join course',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('HUMMING\nBIRD'),
        actions: [


          Text('Episodes'),
          SizedBox(width: 20,),
          Text('About')
        ],
        backgroundColor: Colors.pink,
      ),
      drawer: NevMenu(),
      // drawer: NevMenu(),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'FLUTTER WEB.\nTHE BASIC',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 8,
            ),
            Text(
              'This Flutter Tutorial is specifically designed for beginners and experienced professionals.\n It covers both the basics and advanced concepts of the Flutter framework.',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () {},
                child: Text(
                  'Join course',
                  style: TextStyle(color: Colors.white),
                ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(

        title: Text('HUMMING\nBIRD'),
        actions: [

          
          Text('Episodes'),
          SizedBox(width: 20,),
          Text('About')
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
        
                Text(
                  'FLUTTER WEB.\nTHE BASIC',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
        
                SizedBox(
                  height: 8,
                ),
                Text(
                  'This Flutter Tutorial is specifically \ndesigned for beginners and experienced professionals. \n It covers both the basics and advanced concepts of the Flutter framework.',
                  textAlign: TextAlign.center,
        
        
                ),
        
            ],
        
            ),
            SizedBox(width: 64),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () {},
                child: Text(
                  'Join course',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
        
            ),
          ],
        ),
      )
      );

  }
}
