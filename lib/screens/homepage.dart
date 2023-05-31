import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ragini_infosys/widgets/carousel.dart';

import '../widgets/categories_tab_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            section1(), //section1
            text("SHOP BY YOUR STYLE"),
            wearOptions(), //section2
            text("NEW COLLECTIONS"),
            section3(), //section3
            Image.asset("assets/custom.png"), //section 4
            section5(), //section5
            const SizedBox(
              height: 10.0,
            ),
            headingSection6(),
            section6(),
          ],
        ),
      ),
    );
  }

  Widget section6() {
    Widget imageCard(String url) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(url),
      );
    }

    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageCard("assets/outfit1.png"),
            imageCard("assets/outfit2.png"),
            imageCard("assets/outfit3.png"),
          ],
        ),
      ),
    );
  }

  Widget headingSection6() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "OUTFIT ",
                style: textStyle(),
              ),
              const Text(
                "INSPIRATION",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Text(
            "See All",
            style: TextStyle(
                color: Colors.grey, decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }

  //section5
  Widget section5() {
    Widget iconWithText(String text, IconData iconData) {
      return SizedBox(
        // margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/cart-person.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "do you want a better shopping experience?",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconWithText(
                    "We'll help you find the perfect style and size",
                    FontAwesomeIcons.solidMessage,
                  ),
                  iconWithText(
                    "We have perfect fit gurantee to ensure satisfaction",
                    FontAwesomeIcons.check,
                  ),
                  iconWithText(
                    "Easy returns and Exchange within 30 days",
                    FontAwesomeIcons.box,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget section3() {
    Widget stackIcon() {
      return Stack(
        alignment: Alignment.center,
        children: const [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
          ),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 246, 174, 169),
            radius: 35,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            child: Icon(FontAwesomeIcons.personDress),
          ),
        ],
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const Carousel(),
        CategoriesTabBar(),
        Positioned(bottom: 60.0, child: stackIcon())
      ],
    );
  }

  //section2
  Widget wearOptions() {
    Widget wearOption(String text) {
      return Container(
        margin: const EdgeInsets.all(2.5),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            wearOption("Sports Wear"),
            wearOption("Leisure Wear"),
            wearOption("Work Wear"),
            wearOption("Rest Wear"),
          ],
        ),
      ),
    );
  }

  Widget text(String txt) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        txt,
        style: textStyle(),
      ),
    );
  }

  Widget section1() {
    Widget shadowIcon(Icon icon) {
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(50.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          child: icon,
        ),
      );
    }

    return Stack(
      children: [
        Image.asset("assets/Group_4839.png"),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shadowIcon(const Icon(Icons.menu)),
              Image.asset("assets/logo.png"),
              shadowIcon(const Icon(Icons.search))
            ],
          ),
        )
      ],
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 25.0,
    );
  }
}
