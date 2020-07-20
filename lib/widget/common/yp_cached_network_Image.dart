import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 网络图片加载
class YPCachedNetworkImage extends StatelessWidget {

  final String image;
  final String placeholder;
  final BoxFit fit;
  final double width;
  final double imageSize;
  final bool isCompress;
  final double height;

  const YPCachedNetworkImage({Key key, this.image,this.imageSize : 600,this.isCompress = true, this.placeholder, this.fit, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 占位图
    Widget placeholderWidget;
    if (placeholder != null && placeholder.isNotEmpty && 
    width != null && width > 0 && 
    height != null && height > 0) {
      placeholderWidget = Image.asset(
        placeholder,
        fit: fit,
        width: width,
        height: height,
      );
    }

    return CachedNetworkImage(
      imageUrl: getImageUrl(image,imageSize.toString()),
      placeholder: (context, url) => placeholderWidget,
      fit: fit,
      width: width,
      height: height,
    );

//    if (placeholder ==null){
//      return Image.network(
//        image,
//        fit: fit,
//      );
//    }else{
//      return FadeInImage.assetNetwork(
//        placeholder: placeholder,
//        fit: fit,
//        image: getImageUrl(image,imageSize.toString()),
//        width: width,
//        height: height,
//      );
//    }
  }
  String getImageUrl(String path, String w ){
    if (path.isEmpty) return "";
    if (!isCompress) return path;
    if (path.contains("resources.ypshengxian") || path.contains("test-oss.ypshengxian")) { //腾讯
      path = path + "?style=imageView2/1/w/+" + w + "/h/" + w + "/q/85";
//            path = path+"?style=imageMogr2/format/webp%7CimageView2/1/w/+"+w+"/h/"+w+"/q/85";
    } else if (path.contains("ss1.ypshengxian")) {//阿里云
      path = path + "?x-oss-process=image/resize,w_" + w + ",h_" + w;
    }
    return path;
  }
  
}
