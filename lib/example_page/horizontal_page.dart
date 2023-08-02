import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HorizontalPage extends StatefulWidget {
  const HorizontalPage({Key? key}) : super(key: key);

  @override
  State<HorizontalPage> createState() => _HorizontalPageState();
}

class _HorizontalPageState extends State<HorizontalPage> {
  List<DragAndDropList> _contents = [];
  final double _width = 100;

  @override
  void initState() {
    super.initState();

    _contents = colors
        .map(
          (e) => DragAndDropList(
            header: _header(e),
            children: [],
            contentsWhenEmpty: const SizedBox(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Horizontal')),
      body: DragAndDropLists(
        children: _contents,
        axis: Axis.horizontal,
        onItemReorder: (_, __, ___, ____) {},
        onListReorder: _onListReorder,
        listWidth: _width,
        listDraggingWidth: _width,
        listPadding:
            _contents.isEmpty ? const EdgeInsets.symmetric(vertical: 20) : const EdgeInsets.all(0),
      ),
    );
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

  _header(Color color) => Container(
        width: _width,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.lightGreenAccent, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );
}
