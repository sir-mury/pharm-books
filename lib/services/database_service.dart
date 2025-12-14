import 'package:isar_plus/isar_plus.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  // Database service implementation
  late final Isar db;

  //instantiate isar database
  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = Isar.open(schemas: [], directory: dir.path);
    db = isar;
  }
}
