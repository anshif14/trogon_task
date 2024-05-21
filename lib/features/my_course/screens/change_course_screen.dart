import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogon_task/core/common/image_constants.dart';
import 'package:trogon_task/features/my_course/controller/courseController.dart';
import 'package:trogon_task/features/my_course/screens/levelByCourse.dart';
import 'package:trogon_task/main.dart';
import 'package:trogon_task/models/homeMenuModel.dart';
import 'package:trogon_task/models/levelByCourseModel.dart';
import 'package:trogon_task/models/userModel.dart';

class ChangeCourseScreen extends ConsumerStatefulWidget {
  const ChangeCourseScreen({super.key});

  @override
  ConsumerState<ChangeCourseScreen> createState() => _ChangeCourseScreenState();
}

class _ChangeCourseScreenState extends ConsumerState<ChangeCourseScreen> {
  UserDataModel? userData;

  List<HomeMenuModel> homeMenu = [
    HomeMenuModel(
        icon: ImageConstants.examIcon,
        bgcolors: [const Color(0xffED617B), const Color(0xffF2859B)],
        title: "Exam",
        titleBg: const Color(0xffDC355F)),
    HomeMenuModel(
        icon: ImageConstants.practiceIcon,
        bgcolors: [const Color(0xffFFAF01), const Color(0xffECC07F)],
        title: "Practice",
        titleBg: const Color(0xffFE9900)),
    HomeMenuModel(
        icon: ImageConstants.materialIcon,
        bgcolors: [const Color(0xff24AED2), const Color(0xff7BC9DD)],
        title: "Materials",
        titleBg: const Color(0xff28AFD2)),
  ];

  List<HomeMenuModel> courseList = [
    HomeMenuModel(
        icon: ImageConstants.ktetIcon,
        bgcolors: [],
        title: 'KTET',
        titleBg: Colors.white),
    HomeMenuModel(
        icon: ImageConstants.lpIcon,
        bgcolors: [],
        title: 'LP/UP/HST',
        titleBg: Colors.white),
    HomeMenuModel(
        icon: ImageConstants.setIcon,
        bgcolors: [],
        title: 'SET',
        titleBg: Colors.white),
    HomeMenuModel(
        icon: ImageConstants.netIcon,
        bgcolors: [],
        title: 'NET',
        titleBg: Colors.white),
    HomeMenuModel(
        icon: ImageConstants.montessoriIcon,
        bgcolors: [],
        title: 'Montessori',
        titleBg: Colors.white),
    HomeMenuModel(
        icon: ImageConstants.crashIcon,
        bgcolors: [],
        title: 'Crash course',
        titleBg: Colors.white),
  ];

  getData() async {
    userData = await ref.watch(courseControllerProvider).getUserData();

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getData();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: userData == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff512E7E),
              ),
            )
          : SingleChildScrollView(
        physics: BouncingScrollPhysics(),
            child: Column(
                children: [
                  Container(
                    // height: height*0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff512E7E), Color(0xffA073DA)])),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        ListTile(
                          title: const Text(
                            "Hi Good Morning!",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            userData!.data!.userdata.firstName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04),
                          ),
                          trailing: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Wrap(
                                    children: [
                                      Text(
                                        userData!.data.userdata.coins.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: width * 0.03,
                                            color: const Color(0xffF6B647)),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Image.asset(
                                        ImageConstants.dollarIcon,
                                        height: height * 0.02,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: width * 0.06,
                                  backgroundImage:
                                      NetworkImage(userData!.data.userdata.image),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Container(
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffF2E8F5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Selected Course",
                                      style: TextStyle(color: Color(0xff707070)),
                                    ),
                                    Text(
                                      userData!.data!.userdata.courseName,
                                      style:
                                          const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xff512E7E),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            Text(
                                              "Change ",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Icon(
                                              Icons.swap_horiz,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeMenu.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.redAccent,
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: homeMenu[index].bgcolors),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Center(
                                    child: Image.asset(homeMenu[index].icon),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: homeMenu[index].titleBg,
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      homeMenu[index].title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            // color: Colors.redAccent,
                          ),
                        );
                      },
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Courses",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff512E7E),
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: courseList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9, crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                        LevelByCourseModel  levelModel  = await
                          ref.watch(courseControllerProvider).getCourseLevel();
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => levelByCourse(
                            levelByCourseModel: levelModel,
                            courseId: courseList[index].title,),));
                        },
                        child: Column(
                          children: [
                            Image.asset(courseList[index].icon),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              courseList[index].title,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      );
                    },
                  ),

                  // SizedBox(height: height*0.08,),

                  Stack(
                    children: [
                      Container(
                        height: height*0.25,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height*0.17,
                              width: width*0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color(0x80f6eab6)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(12,0,15,0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            width: width*0.5,
                                            child: Text('Practice With Previous Year Question Papers',

                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),
                                            )),
                                        Text('')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: height*0.07,
                          right: 20,

                          child: Image.asset(ImageConstants.boyIcon)),

                      Positioned(
                        right: width*0.4,
                        bottom: height*0.01,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    CupertinoIcons.arrow_right,color: Colors.white,
                                  ),
                                ),
                              ),
                              height: width*0.12,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff512E7E)
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),
          ),
    );
  }
}
