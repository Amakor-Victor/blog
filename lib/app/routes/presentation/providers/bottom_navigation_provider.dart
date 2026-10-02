import 'package:blog/app/routes/presentation/bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> bottomNavigationBlocProvider = [
  BlocProvider<BottomNavigationBloc>(
    create: (context) => BottomNavigationBloc(),
  ),
];
