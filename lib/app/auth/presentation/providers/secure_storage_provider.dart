import 'package:blog/app/auth/data/datasource/storage_local_data_source.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// final secureStorageProvider = Provider((ref) {
//   return TokenStorage();
// });

List<SingleChildWidget> authSecureStorageProvider = [
  Provider(create: (_) => TokenStorage()),
];
