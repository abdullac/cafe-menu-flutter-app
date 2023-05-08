import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cafemenu_app/core/provider/logics/find_location_distence.dart';
import 'package:cafemenu_app/core/provider/logics/get_shop_location.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/find_location.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

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
      emit(state.copyWith(
        isInsideLocation: locationDistence != null
            ? locationDistence! < 2000.0
                ? true
                : false
            : false,
        isLocationLoading: event.isLocationLoading,
      ));
    });
  }
}
