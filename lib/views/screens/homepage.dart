import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggred_view/modals/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggerd view'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        child: m1(context),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

  Widget m1(BuildContext context) {
    return MasonryGridView.builder(
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: BouncingScrollPhysics(),
        itemCount: details.length,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, i) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detailpage',
                      arguments: details[i]);
                },
                child: Container(
                  height: details[i]['height'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${details[i]['name']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detailpage',
                      arguments: details[i]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image(
                    image: details[i]['image'],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
