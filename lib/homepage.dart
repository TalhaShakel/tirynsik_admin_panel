
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trynsiki_admin_panel/Service.dart';
import 'package:trynsiki_admin_panel/imageService.dart';
import 'package:path/path.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _descriptioncontroller = TextEditingController();
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _nameofsourcecontroller = TextEditingController();

  bool status = false;

  // var ImageP = "";
  // var ImageW = "";
  // var ImageL = "";

  @override
  void dispose() {
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
    _nameofsourcecontroller.dispose();
    super.dispose();
  }

  var imageP, imageW, imageL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
              child: Container(
                height: 500.h,
                width: 80.w,
                decoration: BoxDecoration(border: Border.all()),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                      paneldata(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Title",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 29.h,
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextFormField(
                          controller: _titlecontroller,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 15, left: 10),
                            border: InputBorder.none,
                          ),
                          minLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "name of source",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 200.h,
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextFormField(
                          controller: _nameofsourcecontroller,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                            border: InputBorder.none,
                          ),
                          maxLines: 8,
                          minLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "description",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 200.h,
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextFormField(
                          controller: _descriptioncontroller,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                            border: InputBorder.none,
                          ),
                          maxLines: 8,
                          minLines: 1,
                        ),
                      ),
                      ////////////////////LandScape////////////////////
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "picture landscape",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                      ),
                      Row(children: [
                        GestureDetector(
                          onTap: () async {
                            PickedFile? img =
                                await chooseImage(ImageSource.gallery);

                            if (img != null) {
                              // downloadurl.add(await uploadImageToStorage(img));
                           imageL  = await uploadImageToStorage(img);

                            }
                          },
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Center(
                                child: Text(
                                  "UPLOAD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Image Name",
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ]),

                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "picture portrait",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                      ),

                      Row(children: [
                        GestureDetector(
                          onTap: () async {
                            PickedFile? img =
                                await chooseImage(ImageSource.gallery);

                            if (img != null) {
                              // downloadurl.add(await uploadImageToStorage(img));
                           imageP  = await uploadImageToStorage(img);
                              
                              // print(downloadurl);
                            }
                          },
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Center(
                                child: Text(
                                  "UPLOAD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Image Name",
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ]),

                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "picture for Wallpaper",
                          style:
                              TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                      ),

                      Row(children: [
                        GestureDetector(
                          onTap: () async {
                            PickedFile? img =
                                await chooseImage(ImageSource.gallery);

                            if (img != null) {
                              // downloadurl.add(await uploadImageToStorage(img));
                           imageW  = await uploadImageToStorage(img);
                              
                            }
                          },
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Center(
                                child: Text(
                                  "UPLOAD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Image Name",
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ]),

                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (imageL == null &&
                                imageP == null &&
                                imageW == null &&
                                _nameofsourcecontroller.text
                                        .trim()
                                        .toString() ==
                                    "" &&
                                _titlecontroller.text.trim().toString() == "" &&
                                _descriptioncontroller.text.trim().toString() ==
                                    "") {
                              setState(() {
                                Get.snackbar(
                                    "Kindly Entered All Fields Data", "");
                              });
                            } else {
                              firestore_update(
                                  "admin", "repfHlxtX1DJBZQXs1DF", {
                                "imageData": FieldValue.arrayUnion([
                                  {
                                    "imageL": imageL,
                                    "imageP": imageP,
                                    "imageW": imageW,
                                    "title":
                                        _titlecontroller.text.trim().toString(),
                                    "nameofsource": _nameofsourcecontroller.text
                                        .trim()
                                        .toString(),
                                    "description": _descriptioncontroller.text
                                        .trim()
                                        .toString(),
                                  }
                                ])
                              });
                            }
                          },
                          child: Text("Submit")),
                      SizedBox(
                        height: 20.h,
                      ),

                      ////////////////////
                      //////////////////////////
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row paneldata() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(Icons.delete),
      SizedBox(
        width: 3.w,
      ),
      FlutterSwitch(
        value: status,
        width: 40.0,
        height: 20.0,
        padding: 0,
        toggleColor: Colors.white,
        // inactiveColor: Colors.green,
        activeColor: Colors.green,
        // valueFontSize: 25.0,
        // toggleSize: 45.0,
        // borderRadius: 30.0,
        // padding: 8.0,
        // showOnOff: true,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        },
      ),
      SizedBox(
        width: 3.w,
      ),
      Text(
        "Q00001 - Helena -dieet",
        style: TextStyle(
            fontSize: 11.sp, color: Colors.black, fontWeight: FontWeight.w600),
      )
    ]);
  }

  // Row uplaodimage(nameOfImage, VoidCallback) {
  //   return

  //   Row(children: [
  //     GestureDetector(
  //       onTap: VoidCallback,
  //       child: Container(
  //         width: 50.w,
  //         decoration: BoxDecoration(
  //           color: Colors.blue,
  //           border: Border.all(color: Colors.black),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.all(6.0),
  //           child: Center(
  //             child: Text(
  //               "UPLOAD",
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 12.sp),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     SizedBox(
  //       width: 10.w,
  //     ),
  //     Text(
  //       "$nameOfImage",
  //       style: TextStyle(fontSize: 14.sp),
  //     )
  //   ]);

  // }
}
