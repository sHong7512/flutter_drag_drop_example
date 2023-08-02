import 'package:drag_drop_example/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drag & Drop List Example')),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(VERTICAL_ROUTE);
                },
                child: const Text('Basic Vertical'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HORIZONTAL_ROUTE);
                  },
                  child: const Text('Basic Horizontal')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(COMBINED_ROUTE);
                  },
                  child: const Text('Vertical + Horizontal')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(VERTICAL_UPDATING_ROUTE);
                  },
                  child: const Text('Vertical Updating')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HORIZONTAL_UPDATING_ROUTE);
                  },
                  child: const Text('Horizontal Updating')),
            ],
          ),
        ),
      ),
    );
  }
}
