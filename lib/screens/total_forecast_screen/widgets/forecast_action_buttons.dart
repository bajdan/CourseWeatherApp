import 'package:course_seather_task/screens/landing_screen/cubit/initial_screen_cubit.dart';
import 'package:flutter/material.dart';

class ForecastActionButtons extends StatelessWidget {
  final LandingScreenCubit cubit;

  const ForecastActionButtons({required this.cubit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  onPressed: () {
                    cubit.getForecastByLocation();
                  },
                  icon: const Icon(
                    Icons.my_location,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
