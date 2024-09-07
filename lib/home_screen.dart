import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeScreen> {
  final TextEditingController _glassNoTEController = TextEditingController(
    text: '1',
  );
  List<WaterTrack> waterTrackLists = [];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWaterTrackCounter(),
          SizedBox(
            height: 24,
          ),
          _buidWaterTrackList()
        ],
      ),
    );
  }

  Widget _buidWaterTrackList() {
    return Expanded(
            child: ListView.separated(
        itemCount: waterTrackLists.length,
                itemBuilder: (context, index) {
          final WaterTrack waterTrack=waterTrackLists[index];
                  return ListTile(
                    tileColor: Colors.white,
                    title: Text('Time'),
                    subtitle: Text('Date'),
                    leading: CircleAvatar(child: Text('${waterTrack.noOfGlasses}')),
                    trailing: IconButton(
                      onPressed:()=> _onTapDeletButton(index),
                      icon: Icon(Icons.delete_forever),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                   },
            )
    );
  }


  Widget _buildWaterTrackCounter() {
    return Column(
          children: [
            Text(
              getTotalGlassCount().toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Glass/S',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _glassNoTEController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  width: 24,
                ),
                ElevatedButton(onPressed: _onTapAddWaterTrack, child: Text('Add')),
              ],
            ),
          ],
        );
  }


  int getTotalGlassCount(){
    int counter =0;
    for (WaterTrack t in waterTrackLists){
      counter+=t.noOfGlasses;
    }
    return counter;
  }

  void _onTapAddWaterTrack() {
    if (_glassNoTEController.text.isEmpty) {
      _glassNoTEController.text = '1';
    }
    final int noOfGlasses = int.tryParse(_glassNoTEController.text) ?? 1;
    WaterTrack waterTrack = WaterTrack(
      noOfGlasses: noOfGlasses,
      dateTime: DateTime.now(),
    );
    waterTrackLists.add(waterTrack);
    setState(() {

    });
  }
  void _onTapDeletButton(int index){
    waterTrackLists.removeAt(index);
    setState(() {

    });
  }
}

class WaterTrack {
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlasses, required this.dateTime});
}
