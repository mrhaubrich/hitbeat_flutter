import 'package:sidebarx/sidebarx.dart';

class _Stack {
  final _list = <int>[];

  void push(int value) => _list.add(value);

  int pop() => _list.removeLast();

  int get peek => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();

  // singleton pattern
  static final _Stack _stack = _Stack._internal();

  _Stack._internal();

  static _Stack get instance => _stack;
}

extension SidebarXControllerStackExtension on SidebarXController {
  void push(int index) {
    _Stack.instance.push(selectedIndex);
    selectIndex(index);
  }

  void pop() {
    if (_Stack.instance.isNotEmpty) {
      selectIndex(_Stack.instance.pop());
    }
  }
}
