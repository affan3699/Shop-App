import 'package:flutter/material.dart';
import 'package:shopapp/Models/CartModel.dart';

class Cart extends StatelessWidget {
  List<CartModel> cartList = <CartModel>[];

  Cart(this.cartList);

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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: cartList.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: customUI(context, index, cartList),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget customUI(BuildContext context, int index, List cartList) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(cartList[index].ItemImageURL),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                cartList[index].itemName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.yellow,
                  ),
                  Text("5.0(23 Review)", style: TextStyle(fontSize: 15.0)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "    \$${cartList[index].itemPrice}",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
              Text("Quantity: ${cartList[index].itemQuantity}",
                  style: TextStyle(fontSize: 15.0))
            ],
          )
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            elevation: 0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                side: BorderSide(color: Color(0xFFfef2f2))),
            onPressed: () {},
            color: Colors.redAccent,
            textColor: Colors.white,
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
              child: Text(
                "CHECK OUT",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
