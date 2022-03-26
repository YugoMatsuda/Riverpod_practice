import 'package:flutter/material.dart';
import 'package:riverpod_practice/provider.dart';

import 'logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel {
  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) => _ref = ref;

  get count => _ref.watch(countDataProvider.state).state.count.toString();


}