import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';

class BottomNavigationBloc extends Bloc<NavigationEvent, int> {
  BottomNavigationBloc() : super(0) {
    on<NavigateToCustomPageEvent>((event, emit) {
      emit(event.pageIndex);
    });
  }
  
}
