import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=257845908,2576941774&fm=26&gp=0.jpg",
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  pagination:
                      SwiperPagination(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
