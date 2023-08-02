import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HorizontalUpdatingPage extends StatefulWidget {
  const HorizontalUpdatingPage({Key? key}) : super(key: key);

  @override
  State<HorizontalUpdatingPage> createState() => _HorizontalUpdatingPageState();
}

class _HorizontalUpdatingPageState extends State<HorizontalUpdatingPage> {
  final List<DragAndDropList> _contents = [];
  final double _width = 100;
  final double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horizontal Updating')),
      body: Column(
        children: [
          _colorBox,
          const SizedBox(height: 10),
          Expanded(
            child: DragAndDropLists(
              contentsWhenEmpty: const Text('Drag here'),
              children: _contents,
              onItemReorder: (_, __, ___, ____) {},
              onListReorder: _onListReorder,
              onItemAdd: (_, __, ___) {},
              onListAdd: _onListAdd,

              /// Axis.horizontal 일때 콘텐츠 0개면 버그있음
              /// 아래와 같이 처리해줘야함
              axis: _contents.isEmpty ? Axis.vertical : Axis.horizontal,
              listWidth: _contents.isEmpty ? 0 : _width,
              listDraggingWidth: _contents.isEmpty ? 0 : _width,
              listPadding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

  _onListAdd(DragAndDropListInterface newList, int listIndex) {
    setState(() {
      if (listIndex == -1) {
        _contents.add(newList as DragAndDropList);
      } else {
        _contents.insert(listIndex, newList as DragAndDropList);
      }
    });
  }

  Widget _item(String str, Color color, [double? width, double? height]) => Container(
        width: width ?? MediaQuery.of(context).size.width / 5,
        height: height ?? MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.lightGreenAccent, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );

  Widget get _colorBox => Wrap(
        children: colors
            .map(
              (e) => Draggable<DragAndDropListInterface>(
                feedback: _item('inner item', e),
                data: DragAndDropList(
                  header: _item('inner item', e, _width, _height),
                  children: [],
                  contentsWhenEmpty: const SizedBox(),
                ),
                child: _item('inner item', e),
              ),
            )
            .toList(),
      );
}
