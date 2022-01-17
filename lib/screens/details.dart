import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/util/data.dart';
import 'package:furniture_app/widgets/badge.dart';
import 'package:furniture_app/widgets/product_item.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.shopping_cart,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              buildImage(),
              SizedBox(height: 20.0),
              Text(
                "${furnitures[0]["name"]}",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "\$5.00",
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Descripcion",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Este libro electrónico Budismo moderno. El camino de la compasión y la sabiduría, en tres volúmenes, se distribuye de manera gratuita por deseo del autor Gueshe Kelsang Gyatso. Dice el autor: «Con la lectura y la práctica de las instrucciones que se exponen en esta obra, podremos solucionar los problemas que nos encontremos a diario y mantener una mente feliz en todo momento». Gueshe Kelsang ofrece este libro electrónico de forma gratuita para que todos los seres puedan disfrutar de estos beneficios en todos los rincones del mundo.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Fotos",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              buildProductList(),
              SizedBox(height: 10.0),
            ],
          ),
          buildFloatingButton(),
        ],
      ),
    );
  }

  buildProductList() {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures.reversed.toList()[index];

          return ProductItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

  buildFloatingButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(
                color: Colors.orange[200],
                offset: Offset(0.0, 10.0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Feather.plus,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  buildImage() {
    return Container(
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${furnitures[0]["img"]}",
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -10.0,
            bottom: 3.0,
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.white,
              shape: CircleBorder(),
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Feather.heart,
                  color: Theme.of(context).accentColor,
                  size: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
