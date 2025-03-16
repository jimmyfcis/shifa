// bottom_bar_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_bar_state.dart'; // Import the state file

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit()
      : super(BottomBarInitial()); // Initialize with the default state

  void updateIndex(int index) {
    emit(BottomBarUpdated(index)); // Emit a new state with the updated index
  }
}
