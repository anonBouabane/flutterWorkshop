import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workshop_o1/util/data.dart';
import 'package:workshop_o1/util/images.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hello",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "if it works don`t touch it",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          actions: const [
            CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ))
          ],
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.app_registration_sharp,
              size: 36,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: InputBorder.none,
                              hintText: "Search Box",
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        clipBehavior: Clip.hardEdge,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 300),
                        height: 250.0),
                    items: ListModelPets().modelPicture.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              child: Image.asset(
                                i,
                                fit: BoxFit.cover,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "cetegory",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Explore",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => ontapCurrentIndex(index),
                          child: Container(
                            decoration: BoxDecoration(
                                color: curRrntIndex == index
                                    ? const Color.fromARGB(255, 235, 216, 107)
                                    : Colors.white),
                            child: Row(
                              children: [
                                Image.asset(Images.pets_01),
                                Text(
                                  data[index],
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      primary: false,
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                Images.pets_04,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                data[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int curRrntIndex = 0;
  ontapCurrentIndex(index) {
    setState(() {
      curRrntIndex = index;
    });
  }
}
