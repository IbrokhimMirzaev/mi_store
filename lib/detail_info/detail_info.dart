import 'package:app_flutter/presentation/my_page_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    Key? key,
    required this.myPageInfo,
  }) : super(key: key);

  final MyPageInfo myPageInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: GradientColors.shadesOfGrey, begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: GradientColors.deepBlue),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(gradient: const LinearGradient(colors: GradientColors.rareWind), borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: ShaderMask(
                    shaderCallback: (bounds) => const RadialGradient(
                      colors: GradientColors.seaBlueNew,
                      tileMode: TileMode.mirror,
                    ).createShader(bounds),
                    child: const Icon(Icons.arrow_back_ios_sharp),
                  )),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Details Info", style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: Stack(children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      myPageInfo.imgUrl,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          myPageInfo.phoneName,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                          colors: GradientColors.yellow,
                        ),
                        const SizedBox(height: 30),
                        GradientText(
                          myPageInfo.colorName,
                          colors: GradientColors.wildApple,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                        GradientText(
                          "\$${myPageInfo.price}",
                          colors: GradientColors.passionateRed,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: GradientText(
                  myPageInfo.wikiText,
                  style: const TextStyle(fontSize: 20),
                  colors: GradientColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
