// Conditional import: use native sqlite on IO platforms, stub on web.
import 'db_stub.dart' if (dart.library.io) 'db_native.dart';

void main() {
  initializeDatabase();
}
