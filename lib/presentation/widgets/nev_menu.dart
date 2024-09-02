import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NevMenu extends StatelessWidget {
  const NevMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Kamrul Hasan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('kamrulhasansabug786@gnail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assects/image/kamrul.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover, //image cover set
                ),
              ),
            ),

            //background image  set
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assects/image/background_Image.jpg'),
            //     fit: BoxFit.cover
            //   ),
            //
            // ),
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorit'),
            onTap: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: Text('Notification'),
            onTap: () {},
          ),
          SizedBox(
            height: 8,
          ),Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
