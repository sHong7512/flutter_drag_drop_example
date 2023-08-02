import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:drag_drop_example/main.dart';
import 'package:flutter/material.dart';

class VerticalUpdatingPage extends StatefulWidget {
  const VerticalUpdatingPage({Key? key}) : super(key: key);

  @override
  State<VerticalUpdatingPage> createState() => _VerticalUpdatingPageState();
}

class _VerticalUpdatingPageState extends State<VerticalUpdatingPage> {
  final List<DragAndDropList> _contents = [
    DragAndDropList(
      contentsWhenEmpty: const Text('Drag here'),
      children: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vertical Updating')),
      body: Column(
        children: [
          _colorBox,
          const SizedBox(height: 10),
          Expanded(
            child: DragAndDropLists(
              children: _contents,
              onItemReorder: _onItemReorder,
              onListReorder: (_, __) {},
              onItemAdd: _onItemAdd,
              onListAdd: (_, __) {},
            ),
          ),
        ],
      ),
    );
  }

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onItemAdd(DragAndDropItem newItem, int listIndex, int itemIndex) {
    setState(() {
      if (itemIndex == -1) {
        _contents[listIndex].children.add(newItem);
      } else {
        _contents[listIndex].children.insert(itemIndex, newItem);
      }
    });
  }

  Widget _item(String str, Color color, [double? width]) => Container(
        width: width ?? MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.lightGreenAccent, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );

  Widget get _colorBox => Wrap(
        children: colors
            .map(
              (e) => Draggable<DragAndDropItem>(
                feedback: _item('inner item', e),
                data: DragAndDropItem(child: _item('inner item', e, double.infinity)),
                child: _item('inner item', e),
              ),
            )
            .toList(),
      );
}
