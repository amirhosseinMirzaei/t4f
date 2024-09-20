import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  AnimationController? _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(vsync: this, duration: const Duration(seconds: 3), reverseDuration: const Duration(seconds: 3));
    _lottieController!.forward().then((f) {
      _lottieController!.repeat();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/lottie/search.json",
            controller: _lottieController,
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Text(
                style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 25),
                "میدونستی وقتی صبر میکنی جذاب تر میشی!",
                textDirection: TextDirection.rtl,
              ),
            ),
          )
        ],
      ));
    } catch (e) {}

    return Container();
  }

  @override
  void dispose() {
    if (_lottieController != null) {
      _lottieController!.dispose();
    }
    super.dispose();
  }
}
