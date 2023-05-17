
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/get_user_distence_condition.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menucard_page_event.dart';
part 'menucard_page_state.dart';
part 'menucard_page_bloc.freezed.dart';

class MenucardPageBloc extends Bloc<MenucardPageEvent, MenucardPageState> {
  MenucardPageBloc() : super(MenucardPageState.initial()) {
    /// menucardPage pageview(listview item) left/right scroll indicator
    on<UserScrolledPageview>((event, emit) {
      bool? showLeftArrow;
      bool? showRightArrow;

      /// hide/show right or left sroll indicators when user scroll to pageview end  or start.
      if (event.notification.metrics.extentBefore ==
          event.notification.metrics.minScrollExtent) {
        showLeftArrow = false;
      } else {
        showLeftArrow = true;
      }
      if (event.notification.metrics.extentBefore ==
          event.notification.metrics.maxScrollExtent) {
        showRightArrow = false;
      } else {
        showRightArrow = true;
      }
      emit(state.copyWith(
        showLeftArrow: showLeftArrow,
        showRightArrow: showRightArrow,
        categoryIndex: event.categoryIndex,
      ));
    });

    /// rebuild by location stream
    on<FindLocationByStream>((event, emit) async {
      await getUserDistenceCondition();
      if (userDistenceCondition == null) {
        emit(state.copyWith(
          isInsideLocation: true,
          isLocationLoading: false,
        ));
      } else {
        emit(state.copyWith(
          isInsideLocation: locationDistence != null
              ? locationDistence! <= userDistenceCondition!
                  ? true
                  : false
              : false,
          isLocationLoading: event.isLocationLoading,
        ));
      }
    });
  }
}
