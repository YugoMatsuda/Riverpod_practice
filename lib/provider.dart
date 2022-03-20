import 'package:hooks_riverpod/hooks_riverpod.dart';

final titleProvider = Provider<String>((ref){ return 'Riverpod Demo Home Page';});

final messageProvider = Provider<String>((ref){ return 'You have pushed the button this many times:';});