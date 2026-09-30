import 'package:blog/app/auth/data/datasource/storage_local_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageProvider = Provider((ref) {
  return TokenStorage();
});
