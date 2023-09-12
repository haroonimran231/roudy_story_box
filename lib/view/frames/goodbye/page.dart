import 'index.dart';

class EndingScreen extends StatelessWidget {
  EndingScreen({super.key});
  final endingScreenController = EndingScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightLavender,
      body: Container(
        child: Image.asset(
          "assets/images/bye.png",
          height: 840,
          width: 390,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
