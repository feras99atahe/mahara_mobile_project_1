import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Hello,\n $username',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/user_profile');

                      } ,
                      child: Image.asset(
                        'images/user_profile_image.png',
                        width: 30,
                        height: 30,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Trending',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagespath.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CourseRowWidget(
                      coursename: coursesname[index],
                      imagePath: imagespath[index],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Most Taken',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,

                  child: ListView.builder(
                    scrollDirection: Axis.vertical,

                    itemCount: imagespath.length,
                    itemBuilder: (BuildContext context, int index) =>
                       CourseColumnWidget(
                        coursename: coursesname[index],
                        imagePath: imagespath[index],
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> coursesname = [
  'Chate with the Smarteset Ai Now',
  'HTML - 101',
  'UI/UX Visual Desing',
  'Photography Basics - 101'
];
List<String> imagespath = [
  'images/image1.jpg',
  'images/image2.jpg',
  'images/image3.jpg'
];

class CourseRowWidget extends StatelessWidget {
  const CourseRowWidget(
      {Key? key, required this.coursename, required this.imagePath})
      : super(key: key);

  final String coursename;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          width: 200,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  height: 170 / 2,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  coursename,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Cairo',
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CourseColumnWidget extends StatelessWidget {
  const CourseColumnWidget(
      {super.key, required this.coursename, required this.imagePath});
  final String coursename;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  height: 70,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  coursename,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w100),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

//'Chat with the Smartest Ai now'
