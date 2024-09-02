import 'package:flutter/material.dart';

class DeshboardCard extends StatelessWidget {
  const DeshboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(Icons.timelapse,color: Colors.white,),
          ),
          SizedBox(height: 8,),
          _buildSingleSection(
            'Sales',
            '123487896'
          )
        ],
      ),

    );
  }

  Widget _buildSingleSection(
      String title,String number
      ) {
    return Column(
          children: [
            Text('title'),
            Text('number')
          ],
        );
  }
}
