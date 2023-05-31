import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List imageUrlList = [
    "assets/car1.png",
    "assets/car2.png",
    "assets/car3.png",
    "assets/car4.png",
    "assets/car5.png",
  ];

  int currentIndex = 2;

  Widget buildGallery3D() {
    return Gallery3D(
        controller: Gallery3DController(itemCount: imageUrlList.length),
        width: MediaQuery.of(context).size.width,
        height: 280,
        isClip: true,

        // ellipseHeight: 80,
        // currentIndex: currentIndex,
        onItemChanged: (index) {
          // setState(() {
          //   currentIndex = index;
          // });
        },
        itemConfig: const GalleryItemConfig(
          width: 220,
          height: 280,
          radius: 10,
        ),
        onClickItem: (index) => debugPrint("currentIndex:$index"),
        itemBuilder: (context, index) {
          return Image.asset(
            imageUrlList[index],
            fit: BoxFit.cover,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: PageView.builder(
          clipBehavior: Clip.hardEdge,
          // controller: PageController(),
          itemCount: 1,
          itemBuilder: ((context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildGallery3D(),
              ],
            );
          })),
    );
  }
}
