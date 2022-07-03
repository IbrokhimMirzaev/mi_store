import 'package:app_flutter/detail_info/detail_info.dart';
import 'package:app_flutter/imageScreen/image_screen.dart';
import 'package:app_flutter/presentation/fake_data.dart';
import 'package:app_flutter/presentation/my_page_info.dart';
import 'package:app_flutter/presentation/page_item.dart';
import 'package:app_flutter/presentation/utility_functions.dart';
import 'package:app_flutter/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = FakeData.getMyPages();
  int activeIndex = -1;

  String phoneName = "", colorName = "", imgUrl = "", price = "", wikitext = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController wikiController = TextEditingController();



  final TextEditingController wikiAddControl = TextEditingController();
  final TextEditingController imgAddControll = TextEditingController();

  @override
  void initState() {
    wikiAddControl.text = '''
The Redmi Note 11 Pro has a lower starting price than its predecessors, but also doesn't offer all the modern features that you might expect. It has a 6.67-inch LCD screen with a 60Hz refresh rate and hole-punch front camera at the top. The processor is a Qualcomm Snapdragon 720G which is surprisingly powerful for this segment. You also get a 5020mAh battery and suppport for 18W fast charging. 
The Redmi Note 11 Pro is powerful and everyday work will go smoothly. The display is large and crisp, making games and movies look good. You have a choice between variants, one with 4GB of RAM and 64GB of storage, and the other with 6GB of RAM and 128GB of storage.
The 48-megapixel primary camera was slightly disappointing overall, particularly in low light. There's also an 8-megapixel wide-angle camera, a 5-megapixel macro camera, and a 2-megapixel depth sensor. On the front you get a 16-megapixel selfie camera. The Redmi Note 11 Pro has a lower starting price than its predecessors, but also doesn't offer all the modern features that you might expect. It has a 6.67-inch LCD screen with a 60Hz refresh rate and hole-punch front camera at the top. The processor is a Qualcomm Snapdragon 720G which is surprisingly powerful for this segment. You also get a 5020mAh battery and suppport for 18W fast charging. 
The Redmi Note 11 Pro is powerful and everyday work will go smoothly. The display is large and crisp, making games and movies look good. You have a choice between variants, one with 4GB of RAM and 64GB of storage, and the other with 6GB of RAM and 128GB of storage.
The 48-megapixel primary camera was slightly disappointing overall, particularly in low light. There's also an 8-megapixel wide-angle camera, a 5-megapixel macro camera, and a 2-megapixel depth sensor. On the front you get a 16-megapixel selfie camera. The Redmi Note 11 Pro has a lower starting price than its predecessors, but also doesn't offer all the modern features that you might expect. It has a 6.67-inch LCD screen with a 60Hz refresh rate and hole-punch front camera at the top. The processor is a Qualcomm Snapdragon 720G which is surprisingly powerful for this segment. You also get a 5020mAh battery and suppport for 18W fast charging. 
The Redmi Note 11 Pro is powerful and everyday work will go smoothly. The display is large and crisp, making games and movies look good. You have a choice between variants, one with 4GB of RAM and 64GB of storage, and the other with 6GB of RAM and 128GB of storage.
The 48-megapixel primary camera was slightly disappointing overall, particularly in low light. There's also an 8-megapixel wide-angle camera, a 5-megapixel macro camera, and a 2-megapixel depth sensor. On the front you get a 16-megapixel selfie camera.
    ''';
    imgAddControll.text = "assets/images/11proBlue.jpg";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  list.isNotEmpty
                      ? allDeleteDialog()
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              insetPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 200.h,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 24),
                                child: const Center(
                                  child: Text(
                                    "There is nothing to show. Do not try to delete again!",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                });
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashColor: Colors.red,
              highlightColor: Colors.red,
              icon: Icon(
                Icons.delete_outline_sharp,
                color: Theme.of(context).canvasColor,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 15.w),
            IconButton(
              onPressed: () {
                myCustomDialogAdd();
              },
              constraints: const BoxConstraints(),
              splashColor: Colors.greenAccent,
              highlightColor: Colors.greenAccent,
              icon: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 15.w),
          ],
          title: const Text("Online Store only for Redmi"),
        ),
        body: list.isNotEmpty
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  list.length,
                  (index) => PageItem(
                    itemClicked: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return DetailsInfo(myPageInfo: list[index]);
                          }));
                    },
                    imgClicked: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ImageScreen(imagePath: list[index].imgUrl);
                      }));
                    },
                    phoneName: list[index].phoneName,
                    imgUrl: list[index].imgUrl,
                    price: list[index].price,
                    colorName: list[index].colorName,
                    whenClicked: () {setState(() {activeIndex = index;});},
                    isSelected: activeIndex == index,
                    deleteClicked: () {myCustomDialogDelete(deleteIndex: index, warningText: 'Are you sure to delete this card?');},
                    editClicked: () {myCustomDialogEdit(myPageInfo: list[index], updateIndex: index);},
                  ),
                ),
              )
            : Center(child: Lottie.asset("assets/lottie/empty.json")));
  }

  void myCustomDialogAdd() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: double.infinity,
            height: 400.h,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enter Phone Info",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                TextField(
                  onChanged: (value){
                    phoneName = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: 'Enter phone name'),
                ),
                TextField(
                  onChanged: (value){
                    colorName = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Enter color name',
                  ),
                ),
                TextField(
                  onChanged: (value){
                    price = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: 'Enter its price'),
                ),
                TextField(
                  controller: imgAddControll,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: 'Enter image path'),
                ),
                TextField(
                  controller: wikiAddControl,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: 'Enter some texts about the phone'),
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          if (colorName.isNotEmpty &&
                              phoneName.isNotEmpty &&
                              price.isNotEmpty &&
                              imgAddControll.text.isNotEmpty && wikiAddControl.text.isNotEmpty) {
                            list.add(MyPageInfo(
                                price: price,
                                colorName: colorName,
                                phoneName: phoneName,
                                imgUrl: imgAddControll.text, wikiText: wikiAddControl.text));
                            UtilityFunctions.getMyToast(
                                message: "Added $phoneName");
                            colorName = "";
                            phoneName = "";
                            price = "";
                            Navigator.pop(context);
                          } else {
                            UtilityFunctions.getMyToast(
                                message: "You must fill all inputs");
                          }
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Add Phone",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void myCustomDialogEdit({
    required MyPageInfo myPageInfo,
    required int updateIndex,
  }) {
    nameController.text = myPageInfo.phoneName;
    priceController.text = myPageInfo.price;
    colorController.text = myPageInfo.colorName;
    imgController.text = myPageInfo.imgUrl;
    wikiController.text = myPageInfo.wikiText;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: double.infinity,
            height: 400.h,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enter Phone Info",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: 'Enter phone name'),
                ),
                TextField(
                  controller: colorController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Enter color name',
                  ),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: 'Enter its price'),
                ),
                TextField(
                  controller: imgController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: 'Enter image path'),
                ),

                TextField(
                  controller: wikiController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: 'Enter some texts about the phone'),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          colorName = colorController.text;
                          phoneName = nameController.text;
                          imgUrl = imgController.text;
                          price = priceController.text;

                          if (colorName.isNotEmpty &&
                              phoneName.isNotEmpty &&
                              imgUrl.isNotEmpty &&
                              price.isNotEmpty && wikiController.text.isNotEmpty) {
                            list[updateIndex] = MyPageInfo(
                                price: price,
                                colorName: colorName,
                                phoneName: phoneName,
                                imgUrl: imgUrl, wikiText: wikiController.text);
                            UtilityFunctions.getMyToast(
                                message: "Updated to $phoneName");
                            Navigator.pop(context);
                            colorController.text = "";
                            nameController.text = "";
                            priceController.text = "";
                          } else {
                            UtilityFunctions.getMyToast(
                                message: "You must fill all inputs");
                          }
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Edit Phone Info",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void myCustomDialogDelete(
      {required int deleteIndex, required String warningText}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: double.infinity,
            height: 200.h,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  warningText,
                  style: const TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            UtilityFunctions.getMyToast(
                                message:
                                    "${list[deleteIndex].phoneName} is deleted");
                            if (activeIndex == deleteIndex) activeIndex = -1;
                            list.remove(list[deleteIndex]);
                          });
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const Text(
                          "YES",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          "NO",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void allDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: double.infinity,
            height: 200.h,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Are you sure to delete all items',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            list = [];
                          });
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const Text(
                          "YES",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          "NO",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    imgController.dispose();
    wikiController.dispose();
    priceController.dispose();
    colorController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
