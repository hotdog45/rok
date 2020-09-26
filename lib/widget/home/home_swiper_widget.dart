import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/style/style.dart';

import 'home_item.dart';

class HomeBannerWidget extends StatelessWidget {


  final List<Banners> banners;

  const HomeBannerWidget({Key key, this.banners}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            banners[index].imgUrl,
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(),
      ),
    );
  }
}
