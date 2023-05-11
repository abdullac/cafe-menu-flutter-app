import 'package:cafemenu_app/core/provider/bloc/admin/location_page/location_page_bloc.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget(page) for set shop location by admin
class PageLocation extends StatelessWidget {
  const PageLocation({Key? key}) : super(key: key);

  static TextEditingController distenceEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// blocProvider for get current location and rebuild page/widget
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<LocationPageBloc>(context)
          .add(const GetCurrentLocation());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Location"),
      ),
      body: SafeArea(
        child: BlocBuilder<LocationPageBloc, LocationPageState>(
          builder: (context, state) {
            /// assing location Position to shoplocationByAdmin
            shoplocationByAdmin = state.currentLocation;

            /// get latitude and logtitude from Position
            double? latitude;
            double? longtitude;
            if (state.currentLocation != null) {
              latitude = state.currentLocation!.latitude;
              longtitude = state.currentLocation!.longitude;
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// loading circular wehe loading location
                  state.isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : state.currentLocation != null
                          ? Text(
                              "Location : ${latitude ?? ''}, ${longtitude ?? ''}",
                            )
                          : const Text("C'not get Location"),
                  state.currentLocation != null

                      /// set current location button
                      ? Center(
                          child: Column(
                            children: [
                              const DistenceConditionButtonAndField(),
                              ElevatedButton(
                                onPressed: () {
                                  /// save current location to fire base button pressed
                                  if (shoplocationByAdmin != null) {
                                    BlocProvider.of<LocationPageBloc>(context)
                                        .add(SaveLocation(
                                      location: shoplocationByAdmin!,
                                      distenceMeter: distenceEditingController
                                                  .text ==
                                              ""
                                          ? null
                                          : double.parse(
                                              distenceEditingController.text),
                                    ));
                                  }
                                  if (state.hasLocationSaved == true &&
                                      state.hasSavedDistence == true) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text(
                                  "Apply Current Location and Condition",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DistenceConditionButtonAndField extends StatelessWidget {
  const DistenceConditionButtonAndField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPageBloc, LocationPageState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// set distence condition button
            ElevatedButton(
              onPressed: () {
                if (state.isPressedDistenceConditionButton == true) {
                  PageLocation.distenceEditingController.text = "";
                }
                BlocProvider.of<LocationPageBloc>(context).add(
                    SetDistenceConditionButton(
                        isPressedDistenceConditionButton:
                            state.isPressedDistenceConditionButton == true
                                ? false
                                : true));
              },
              child: Text(state.isPressedDistenceConditionButton == true
                  ? "No Distence Condition"
                  : "Set Distence Condition"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Customer can view items and give order within given meter distence.\nMust set distence condition every change location if want distence condition.",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            state.isPressedDistenceConditionButton == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: PageLocation.distenceEditingController,
                      decoration: const InputDecoration(
                          hintText: "Distence meter. eg: 5.0",
                          border: OutlineInputBorder()),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }
}
