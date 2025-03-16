// bottom_bar_state.dart

abstract class BottomBarState {
  final int selectedIndex;

  BottomBarState(this.selectedIndex);
}

class BottomBarInitial extends BottomBarState {
  BottomBarInitial() : super(0); // Default selected index is 0
}

class BottomBarUpdated extends BottomBarState {
  BottomBarUpdated(int selectedIndex) : super(selectedIndex);
}
