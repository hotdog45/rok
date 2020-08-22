import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/common/style/style.dart';

import 'home_item.dart';

class HomeBannerWidget extends StatelessWidget {
  final String name;
  final String url;

  const HomeBannerWidget({Key key, this.name, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        pagination: SwiperPagination(),
      ),
    );
  }
}
