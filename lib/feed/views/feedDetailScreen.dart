import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class feedDetailedScreen extends StatelessWidget {
  const feedDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black,
      ),
      drawer:  NavigationDrawer(),
    );
  }
  

}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) =>Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         
        const DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 65, 75, 83),
        ),
        child: Text('Shanil A V'),
      ),
       ListTile(
        title: const Text(''),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
       ListTile(
        title: const Text('job'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
       ListTile(
        title: const Text('internship'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
       ListTile(
        title: const Text('events'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ],
    ),
  );
    
}