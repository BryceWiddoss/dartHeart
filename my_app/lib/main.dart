import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleTabsApp());
}

class SimpleTabsApp extends StatelessWidget {
  const SimpleTabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController( // DefaultTabController - works by creating a TabController and making it available to its children.
                                  // Takes a names ‘length’ parameter which determines the number of tabs
        length: 3, // 3 tabs total. Length determines tab number.
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Super Awesome Fun Tabs'),
            bottom: const TabBar( // Used to name the tabs. Should have the same number of named tabs as defined by DefaultTabController.
              tabs: [
                Tab(text: 'Red'),
                Tab(text: 'Green'),
                Tab(text: 'Blue'),
              ],
            ),
          ),
          body: TabBarView( // stores the actual content of your tabs. It works by taking in a list of widgets corresponding in number to length, which is the number of tabs. 
            children: [
              const RedTab(),
              const ColoredBox(color: Colors.green),
              const ColoredBox(color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class RedTab extends StatelessWidget {
  const RedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);

    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pick either tab 1 (Green) or 2 (Blue)
            int randomTab = Random().nextBool() ? 1 : 2;
            controller.animateTo(randomTab); // animateTo function works on one tab and directs the user to another tab
          },
          child: const Text(
            'Go to Random Tab! Gambling is fun!!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
