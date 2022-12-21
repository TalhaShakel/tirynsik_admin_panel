import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trynsiki_admin_panel/Service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            home: MyHomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _descriptioncontroller = TextEditingController();
  TextEditingController _titlecontroller = TextEditingController();

  Uint8List? imageP, imageW, imageL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      Uint8List? img = await pickImage(ImageSource.gallery);
                      if (img != null) {
                        setState(() {
                          imageP = img;
                        });
                      }
                    },
                    child: Text("Image P")),
                ElevatedButton(
                    onPressed: () async {
                      Uint8List? img = await pickImage(ImageSource.gallery);
                      if (img != null) {
                        setState(() {
                          imageW = img;
                        });
                      }
                    },
                    child: Text("Image W")),
                ElevatedButton(
                    onPressed: () async {
                      Uint8List? img = await pickImage(ImageSource.gallery);
                      if (img != null) {
                        setState(() {
                          imageL = img;
                        });
                      }
                    },
                    child: Text("Image L")),
                ElevatedButton(
                    onPressed: () {
                      if (imageL == null &&
                          imageP == null &&
                          imageW == null &&
                          _titlecontroller == null &&
                          _descriptioncontroller == null) {
                        setState(() {
                          Get.snackbar("Kindly Entered All Fields Data", "");
                        });
                      }
                    },
                    child: Text("Submit")),
              ],
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                controller: _descriptioncontroller,
                decoration: InputDecoration(hintText: "Title"),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                controller: _titlecontroller,
                decoration: InputDecoration(hintText: "Description"),
              ),
            ),
            imageP == null
                ? Container(
                    child: Text("Please select an Image"),
                  )
                : Container(
                    height: 600.h,
                    width: 200.w,
                    color: Colors.transparent,
                    child: Image.memory(
                      imageP!,
                      fit: BoxFit.cover,
                    ),
                  ),
            ///////////
            imageW == null
                ? Container(
                    child: Text("Please select an Image"),
                  )
                : Container(
                    height: Get.height.h,
                    width: Get.width.w,
                    color: Colors.transparent,
                    child: Image.memory(
                      imageW!,
                      fit: BoxFit.cover,
                    ),
                  ),
            imageL == null
                ? Container(
                    child: Text("Please select an Image"),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
                    child: Container(
                      height: Get.height.h,
                      width: Get.width.w,
                      color: Colors.transparent,
                      child: Image.memory(
                        imageL!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
