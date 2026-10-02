part of 'navigation_bloc.dart';

sealed class NavigationEvent {
  const NavigationEvent();
}

class NavigateToCustomPageEvent extends NavigationEvent {
  final int pageIndex;
  const NavigateToCustomPageEvent({required this.pageIndex});
}
