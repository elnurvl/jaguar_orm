import 'dart:io';

String readFile(String path) {
  var file = File(path);
  return file.readAsStringSync();
}