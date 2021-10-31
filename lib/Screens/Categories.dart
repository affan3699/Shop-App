import 'package:flutter/material.dart';

import 'Detail.dart';
import 'Drawer.dart';

class Categories extends StatefulWidget {
  String categoryName;
  bool loggedIn;

  Categories(this.categoryName, this.loggedIn);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              verticalContainerUI(
                  context,
                  "https://www.windowscentral.com/sites/wpcentral.com/files/styles/large_wm_brw/public/field/image/2020/08/samsung-galaxy-note-20-ultra-1.jpg",
                  " Note 20 Ultra",
                  "80000",
                  "Samsung Galaxy Note 20 Ultra is powered by a 2.4GHz octa-core Samsung Exynos 990 processor that features 4 cores clocked at 2.4GHz and 4 cores clocked at 1.8GHz.",
                  "10000"),
              verticalContainerUI(
                  context,
                  "https://apollo-singapore.akamaized.net/v1/files/wwc7zm566vp41-PK/image;s=850x0",
                  " MI Box S",
                  "8000",
                  "This Box features the Cortex-A53 Quad-core CPU and Mali 450 GPU along with 2 GB of RAM and 8 GB of internal storage.",
                  "1000"),
              verticalContainerUI(
                  context,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuoQlGKW_PU5EjeUIR9SoXnZSj1jUWT-h0IA&usqp=CAU",
                  " Macbook Air",
                  "80000",
                  "Apple MacBook Air 2020 is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM.",
                  "10000"),
              verticalContainerUI(
                  context,
                  "https://www.telemart.pk/uploads/product_image/product_36068_1.jpg",
                  " Nivdia 1080 TI",
                  "80000",
                  "The GeForce® GTX 1080 Ti is our flagship 10-series gaming GPU. This card is packed with extreme gaming horsepower, next-gen 11 Gbps GDDR5X memory, and a massive 11 GB frame buffer. #GameReady",
                  "10000"),
              verticalContainerUI(
                  context,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmpLeNCyjCDidDuFU3SWPU3Q7aGkqHT9FCkg3oGMhn7JTOU1wBfbjB9bTKUZJ8T90KCHw&usqp=CAU",
                  " Iphone 12",
                  "80000",
                  "Samsung",
                  "10000"),
              verticalContainerUI(
                  context,
                  "https://i2.wp.com/electronicgears.com.pk/wp-content/uploads/2020/11/Intel-Core-i7-10700k-10th-Generation-Processor-LGA1200-Comet-Lake.jpg?fit=825%2C825&ssl=1",
                  " Core i7",
                  "80000",
                  "he Intel Core i7-11700K offers excellent performance for an eight-core chip, but its pricing makes it the last resort that you should only buy if competing chips are out of stock and you need an eight-core chip specifically for productivity",
                  "10000"),
            ],
          ),
        ),
      ),
    );
  }

  Widget verticalContainerUI(BuildContext context, String networkImage,
      String productName, String price, String des, String discount) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(productName, price, des,
                    discount, networkImage, widget.loggedIn)));
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        width: 335,
        height: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(networkImage),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              productName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.yellow,
                ),
                Text(" 5.0 (23 Reviews)", style: TextStyle(fontSize: 15.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
