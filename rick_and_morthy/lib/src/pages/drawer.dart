import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("navigator Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.indigoAccent),
              accountEmail: Text("Walls Team @gmail.com"),
              accountName: Text("Rick and morthy"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
              ),
            ),
            ListTile(
              title: Text("personajes"),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.pushNamed(context, "principal");
              },
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[100],
        child: Center(
          child: Text("MENU PRINCIPAL DE RICK AND MORTHY"),
        ),
      ),
    );
  }
}
