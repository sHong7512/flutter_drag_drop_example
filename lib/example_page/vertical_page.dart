import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class VerticalPage extends StatefulWidget {
  const VerticalPage({Key? key}) : super(key: key);

  @override
  State<VerticalPage> createState() => _VerticalPageState();
}

class _VerticalPageState extends State<VerticalPage> {
  final List<DragAndDropList> _contents = [
    DragAndDropList(
        contentsWhenEmpty: const Text('Drag here'),
        children: colors
            .map(
              (e) => DragAndDropItem(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: e,
                    border: Border.all(color: Colors.lightGreenAccent, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            )
            .toList()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Vertical')),
      body: DragAndDropLists(
        children: _contents,
        onItemReorder: _onItemReorder,
        onListReorder: (_, __) {},
      ),
    );
  }

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }
}
