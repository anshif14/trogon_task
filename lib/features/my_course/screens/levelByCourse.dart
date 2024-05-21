
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:trogon_task/core/common/image_constants.dart';
import 'package:trogon_task/features/my_course/controller/courseController.dart';
import 'package:trogon_task/models/levelByCourseModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

class levelByCourse extends ConsumerStatefulWidget {
  final String courseId;
  final LevelByCourseModel levelByCourseModel;
  const levelByCourse(
      {required this.courseId, required this.levelByCourseModel, super.key});

  @override
  ConsumerState<levelByCourse> createState() => _levelByCourseState();
}

class _levelByCourseState extends ConsumerState<levelByCourse> {
  DateTime _focusDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  int selecetedIndex =2;
  int unlockedIndex = 3;
  
  int selectedLevelId = 0;
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  LevelByCourseModel? levelModel;

  getData() async {
    levelModel = widget.levelByCourseModel;
    
    selectedLevelId = int.parse(levelModel!.data[selecetedIndex].lessons[0].courseId);

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getData();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: levelModel == null
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0xff512E7E),
              ),
            )
          : SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                    height: height * 0.3,
                    width: width,
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.2,
                          width: width,
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.2,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(width * 0.04),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Color(0xff512E7E),
                                      Color(0xffA073DA)
                                    ])),
                                child: Column(
                                  children: [
                                    // SizedBox(
                                    //   height: height * 0.05,
                                    // ),
                                    AppBar(
                                      title: Text(
                                        widget.courseId,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      centerTitle: true,
                                      backgroundColor: Colors.transparent,
                                      leading: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            CupertinoIcons.back,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              height: height * 0.2,
                              width: width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(
                                  children: List.generate(
                                      levelModel!.data.length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                              onTap: () {
                                                setState(() {

                                                  selecetedIndex =  index;


                //                                   if(  unlockedIndex>=index) {
                                                    selectedLevelId =  int.parse(levelModel!.data[index].id);
                                                    print(selectedLevelId);
                //                                   }
                //                                   else{
                // return showTopSnackBar(
                //   Overlay.of(context),
                //   CustomSnackBar.error(
                //     message:
                //     "Day ${index+1} is not unlocked",
                //   ),
                // );
                //                                   }
                                                });
                                              },
                                              child: Container(
                                                height: height * 0.12,
                                                width: width*0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Color(0xffF2E8F5),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Container(
                                                      width: width,
                                                      height: height,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(50),
                                                        color: selecetedIndex == index
                                                            ? Color(0xff553283)
                                                            : Colors.transparent,
                                                      ),
                                                      child:
                                                          unlockedIndex<index?

                                                          Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Text(
                                                                "DAY",
                                                                style: TextStyle(
                                                                    color: Color(0xffCECECE),
                                                                    fontWeight:
                                                                    FontWeight.w400),
                                                              ),
                                                             Icon(CupertinoIcons.lock,
                                                             color:  Color(0xff553283),
                                                             ),
                                                              Text(
                                                                levelModel!.data[index].completion,
                                                                style: TextStyle(
                                                                    color: Color(0xffCECECE),
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ):

                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "DAY",
                                                            style: TextStyle(
                                                                color: selecetedIndex == index
                                                                    ? Color(0xffF2E8F5)
                                                                    : Color(0xff553283),
                                                                fontWeight:
                                                                    FontWeight.w400),
                                                          ),
                                                          Text(
                                                            "${index+1}",
                                                            style: TextStyle(
                                                             color:    selecetedIndex == index
                                                                    ? Color(0xffF2E8F5)
                                                                    : Color(0xff553283),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          Text(
                                                            levelModel!.data[index].completion,
                                                            style: TextStyle(
                                                                color: selecetedIndex == index
                                                                    ? Color(0xffF2E8F5)
                                                                    : Color(0xff553283),
                                                                fontWeight:
                                                                    FontWeight.w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      )),
                                ),
                              )),
                        ),

                      ],
                    ),
                  ),
                Container(
                  height: height*0.15,
                  width: width*0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageConstants.lockIcon),scale: 0.8),
                    borderRadius: BorderRadius.circular(12),
                      color: Color(0xffFBF4DA)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: width*0.45,
                          child: Text('Upgrade and unlock the full course',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                          ),
                          )),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         color: Color(0xffEB5443)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.fromLTRB(10,8.0,10,8),

                         child: Text("Upgrade",style: TextStyle(
                           color: Colors.white,
                           fontSize: 16,
                           fontWeight: FontWeight.w600
                         ),),
                       ),
                     )
                    ],
                  ),
                ),
                SizedBox(height: height*0.05,),

                Container(
                  height: height*0.15,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      // image: DecorationImage(image: AssetImage(ImageConstants.lockIcon),scale: 0.8),
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0x1a4caf50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' WhatsApp ലെ സഹായത്തിനായി',style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: width*0.45,
                                  child: Text("8606017527"

                                  ,style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16
                                    ),
                                  )),
                             InkWell(
                                 onTap: () {
                                   Future<void> _launchUrl() async {
                                     Uri _url = Uri.parse("https://wa.me/+918606017527/?text=${Uri.parse("Hello world")}");
                                     if (!await launchUrl(_url)) {
                                       throw Exception('Could not launch $_url');
                                     }
                                   }
                                   _launchUrl();
                                 },
                                 child: Image.asset(ImageConstants.wpIcon,height: height*0.04,))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                ListView.builder(
physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: levelModel!.data[selecetedIndex].lessons.length,
                  itemBuilder: (context, index2) {
                    Lesson data = levelModel!.data[selecetedIndex].lessons[index2];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height*0.12,decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5.5,
                          color: Colors.black12
                        )
                      ]

                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Container(
                              decoration: BoxDecoration(

                                image: DecorationImage(image: AssetImage(ImageConstants.thumbnailIcon))
                                // image: DecorationImage(image: levelModel!.data[index].)
                              ),
                              height: width*0.3,
                              width: width*0.2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Text("Day ${selecetedIndex+1} Lesson ${index2+1}",style: TextStyle(
                                color: Color(0xff553283)
                              ),),

                              SizedBox(
                                  width:width*0.5,
                                  child: Text(data.title))
                            ],),
                            CircularPercentIndicator(
                              backgroundColor: Color(0xffF2E8F5),
                              radius: 30.0,
                              lineWidth: 5.0,
                              percent: 0.5,
                              center: new Text("10.3 min",style: TextStyle(
                                color: Color(0xffA4A4A4),
                                fontSize: 10
                              ),),

                              progressColor: Color(0xff553283),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },)

              ],
            ),
          ),
    );
  }
}
//
//
// Widget a = EasyInfiniteDateTimeLine(
// showTimelineHeader: false
// ,
//
// itemBuilder: (context, date, isSelected, onTap) {
//
// return InkWell(
// onTap: (){
//
// setState(() {
//
// _focusDate = DateTime(
// date.year,
// date.month,
// date.day
// );
// date = _focusDate;
//
// });
//
// print(date == _focusDate);
//
// },
// child: Container(
// height: height*0.1,
//
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// color: Color(0xffF2E8F5),
//
// ),
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(3.0),
// child: Container(
// width: width,
// height: height,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// color:_focusDate == date? Color(0xff553283):Colors.transparent,),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text("DAY",style: TextStyle(
// color:_focusDate == date? Color(0xffF2E8F5): Color(0xff553283),
// fontWeight: FontWeight.w400
// ),),
// Text(
//
//
// DateFormat('dd').format(date),
// style: TextStyle(
// color: Color(0xff553283),
// fontSize: 18,
// fontWeight: FontWeight.w600
// ),
//
//
//
// ),
// Text(DateFormat('MM/yy').format(date),style: TextStyle(
// color: Color(0xff553283),
// fontWeight: FontWeight.w400
// ),),
// ],
// ),
// ),
// ),
// ),
// ),
// );
// },
// controller: _controller,
// firstDate: DateTime.now(),
//
// focusDate: _focusDate,
// lastDate: DateTime(2028, 12, 31),
// onDateChange: (selectedDate) {
// setState(() {
// print('object');
// _focusDate = DateTime(
// selectedDate.year,
// selectedDate.month,
// selectedDate.day
// );
// });
// },
//
// );
