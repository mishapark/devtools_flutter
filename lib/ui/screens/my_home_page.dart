import 'package:devtools_flutter/business/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.currentPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Students'),
            BottomNavigationBarItem(
                icon: Icon(Icons.diversity_3), label: 'Activists'),
          ],
          onTap: (index) {
            state.changeTab(index);
            setState(() {});
          },
        ),
        body: Center(
          child: state.views.elementAt(state.currentPageIndex),
        ),
      ),
    );
  }
}
