import 'package:flutter/material.dart';


class feedDetailedScreen extends StatelessWidget {
  const feedDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    
    // final Test test;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.black,
      ),
      
      drawer:  const NavigationDrawer(),
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