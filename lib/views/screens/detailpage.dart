import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:staggred_view/modals/globals.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> h1 =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List photo = h1['photoslist'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          h1['name'],
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: photo
                .map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(e),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 250,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(h1['details'],style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
