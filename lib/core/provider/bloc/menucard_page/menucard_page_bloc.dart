import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menucard_page_event.dart';
part 'menucard_page_state.dart';
part 'menucard_page_bloc.freezed.dart';

class MenucardPageBloc extends Bloc<MenucardPageEvent, MenucardPageState> {
  MenucardPageBloc() : super(MenucardPageState.initial()) {
    on<LeftScrollIndicator>((event, emit) {
      emit(state.copyWith(
        showLeftArrow: event.reachToStart == true ? false : true,
        categoryIndex: event.categoryIndex,
      ));
    });
    on<RightScrollIndicator>((event, emit) {
      emit(state.copyWith(
        showRightArrow: event.reachToEnd == true ? false : true,
        categoryIndex: event.categoryIndex,
      ));
    });

    on<UserScrolledPageview>((event, emit) {
      bool? showLeftArrow;
      bool? showRightArrow;

      /// hide/show riht or left sroll indicators when user scroll to pageview end  or start.
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
  }
}
