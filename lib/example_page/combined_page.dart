import 'dart:math';

import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CombinedPage extends StatefulWidget {
  const CombinedPage({Key? key}) : super(key: key);

  @override
  State<CombinedPage> createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  List<DragAndDropList> _contents = [];
  final double _width = 100;

  @override
  void initState() {
    super.initState();

    _contents = colors
        .map(
          (e) => DragAndDropList(
            header: _header(e),
            children: List.generate(Random().nextInt(10), (index) => _item('$index')),
            contentsWhenEmpty: const SizedBox(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Combined')),
      body: DragAndDropLists(
        children: _contents,
        axis: Axis.horizontal,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        listWidth: _width,
        listDraggingWidth: _width,
        listPadding: const EdgeInsets.all(0),
      ),
    );
  }

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
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

  _item(String str) => DragAndDropItem(
        child: Container(
          width: _width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            border: Border.all(color: Colors.lightGreenAccent, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(child: Text(str)),
        ),
      );
}
