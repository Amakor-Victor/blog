import 'package:blog/app/auth/presentation/providers/auth_providers.dart';
import 'package:blog/app/auth/presentation/providers/secure_storage_provider.dart';
import 'package:blog/app/blog/presentation/providers/blog_providers.dart';
import 'package:blog/app/routes/presentation/providers/bottom_navigation_provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ...authDataPoviders,
  ...authDomainProvider,
  ...authBlocProviders,
  ...authSecureStorageProvider,
  ...bottomNavigationBlocProvider,
  ...blogDataProvider,
  ...blogDomainProvider,
  ...blogBlocProvider,
];
