import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Screens/Cart.dart';
import 'package:shopapp/Screens/Categories.dart';
import 'package:shopapp/Screens/Detail.dart';
import 'package:shopapp/Screens/Drawer.dart';

import 'Login.dart';
import 'Profile.dart';

class Home extends StatefulWidget {
  bool loggedIn;

  Home(this.loggedIn);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cart(cartList)));
            },
            child: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
          ),
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Text("Profile"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.redAccent,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      autofocus: false,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value == "") {
                          Fluttertoast.showToast(
                            msg: "Please Enter Some Text",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black87,
                            textColor: Colors.white,
                            fontSize: 15.0,
                          );
                        } else {}
                        ;
                        searchController.clear();
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Products",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              //color: Colors.yellow,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  horizontalListTile(
                      context, "Electronic", Icons.electrical_services),
                  horizontalListTile(context, "Cars", Icons.car_rental),
                  horizontalListTile(context, "Mobile", Icons.mobile_friendly),
                  horizontalListTile(
                      context, "Clothes", Icons.person_outline_sharp),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Popular Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                verticalContainerUIGridView(
                    context,
                    "https://www.windowscentral.com/sites/wpcentral.com/files/styles/large_wm_brw/public/field/image/2020/08/samsung-galaxy-note-20-ultra-1.jpg",
                    " Note 20 Ultra",
                    "80000",
                    "Samsung Galaxy Note 20 Ultra is powered by a 2.4GHz octa-core Samsung Exynos 990 processor that features 4 cores clocked at 2.4GHz and 4 cores clocked at 1.8GHz.",
                    "10000"),
                verticalContainerUIGridView(
                    context,
                    "https://apollo-singapore.akamaized.net/v1/files/wwc7zm566vp41-PK/image;s=850x0",
                    " MI Box S",
                    "8000",
                    "This Box features the Cortex-A53 Quad-core CPU and Mali 450 GPU along with 2 GB of RAM and 8 GB of internal storage.",
                    "1000"),
                verticalContainerUIGridView(
                    context,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuoQlGKW_PU5EjeUIR9SoXnZSj1jUWT-h0IA&usqp=CAU",
                    " Macbook Air",
                    "80000",
                    "Apple MacBook Air 2020 is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM.",
                    "10000"),
                verticalContainerUIGridView(
                    context,
                    "https://www.telemart.pk/uploads/product_image/product_36068_1.jpg",
                    " Nivdia 1080 TI",
                    "80000",
                    "The GeForce® GTX 1080 Ti is our flagship 10-series gaming GPU. This card is packed with extreme gaming horsepower, next-gen 11 Gbps GDDR5X memory, and a massive 11 GB frame buffer. #GameReady",
                    "10000"),
                verticalContainerUIGridView(
                    context,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmpLeNCyjCDidDuFU3SWPU3Q7aGkqHT9FCkg3oGMhn7JTOU1wBfbjB9bTKUZJ8T90KCHw&usqp=CAU",
                    " Iphone 12",
                    "80000",
                    "Samsung",
                    "10000"),
                verticalContainerUIGridView(
                    context,
                    "https://i2.wp.com/electronicgears.com.pk/wp-content/uploads/2020/11/Intel-Core-i7-10700k-10th-Generation-Processor-LGA1200-Comet-Lake.jpg?fit=825%2C825&ssl=1",
                    " Core i7",
                    "80000",
                    "he Intel Core i7-11700K offers excellent performance for an eight-core chip, but its pricing makes it the last resort that you should only buy if competing chips are out of stock and you need an eight-core chip specifically for productivity",
                    "10000"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) async {
    switch (item) {
      case 0:
        if (widget.loggedIn == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile()));
        } else {
          Fluttertoast.showToast(
            msg: "YOU ARE NOT LOGGED IN",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        }

        break;
      case 1:
        if (widget.loggedIn == true) {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        } else {
          Fluttertoast.showToast(
            msg: "YOU ARE NOT LOGGED IN",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        }
        break;
    }
  }

  Widget verticalContainerUIGridView(BuildContext context, String networkImage,
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
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 12.0,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 12.0,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 12.0,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 12.0,
                  color: Colors.yellow,
                ),
                Text(" 5.0 (23 Reviews)", style: TextStyle(fontSize: 12.0)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget horizontalListTile(
      BuildContext context, String itemCategory, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Categories(itemCategory, widget.loggedIn)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 192,
        margin: EdgeInsets.all(11.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 20.0,
            color: Colors.redAccent,
          ),
          title: Text(
            itemCategory,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          subtitle: Text("20 items", style: TextStyle(fontSize: 11.0)),
        ),
      ),
    );
  }
}
