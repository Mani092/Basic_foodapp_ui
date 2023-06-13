import 'package:basicfoodapp/constants.dart';
import 'package:basicfoodapp/function.dart';
import 'package:basicfoodapp/product.dart';
import 'package:basicfoodapp/product_item.dart';
import 'package:flutter/material.dart';


const PRODUCT_DATA = [
  {"image": "pizza.png", "name": "Pizza", "rest": "Maritine Star Restaurant", "rating": "4.5 (164)", "price": 20, "currency": "\$"},
  {"image": "burger.png", "name": "Burger", "rest": "Maritine Star Restaurant", "rating": "4.7 (199)", "price": 10, "currency": "\$"},
  {"image": "fries.png", "name": "Fries", "rest": "Maritine Star Restaurant", "rating": "4.2 (101)", "price": 10, "currency": "\$"},
  {"image": "hotdog.png", "name": "HotDog", "rest": "Maritine Star Restaurant", "rating": "3.9 (150)", "price": 15, "currency": "\$"},
];

const CATEGORIES = [
  {"image": "salad.png", "name": "Salad"},
  {"image": "fastfood.png", "name": "Fast Food"},
  {"image": "desert.png", "name": "Desert"},
  {"image": "drinks.png", "name": "Drinks"},
  {"image": "drinks.png", "name": "Drinks"},
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FocusNode _focusNode=FocusNode();

  @override
  void dispose(){
    super.dispose();
        _focusNode.unfocus();
  }
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context,constraints){
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: constraints.maxHeight*0.4,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                          Container(
                            color: COLOR_GREEN,
                          ),
                        Image.asset("assets/images/tree_v.png"),
                        Padding(padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset("assets/images/avatar.png"),
                                  ),
                                ),
                                addHorizontalSpace(20),
                                 Expanded(child: Text("How hungry are you today ?",
                                style: textTheme.headline5!.apply(
                                  color: Colors.white,
                                ),
                                )),
                              ],
                            ),
                             TextField(
                               style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: "Search food",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              prefixIcon: const Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white24,
                                suffixIcon: Container(
                                  width: 70,
                                  height: 70,
                                  decoration:  const BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                )

                              ),
                            ),
                            addVerticalSpace(10),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    color: Colors.grey.shade200,
                    child:  Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              addVerticalSpace(constraints.maxWidth *0.35),
                              Row(
                                children: [
                                  Text("Popular Foods",
                                  style: textTheme.headline5,
                                  ),
                                const Expanded(child: Center()),
                                  Text(
                                    "View All >",
                                    style: textTheme.subtitle2!.apply(color: COLOR_ORANGE),
                                  ),
                                  addHorizontalSpace(10),
                                ],
                              ),
                              addVerticalSpace(10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: PRODUCT_DATA.map((data) => InkWell(
                                    onTap: (){
                                      _focusNode.unfocus();
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(productData: data)));
                                    },
                                      child: Product(
                                        productData: data,
                                        width: constraints.maxWidth*0.5,
                                      ),
                                  )).toList(),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                              top: -constraints.maxWidth *0.15,
                              left: 0,
                              child: Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.17,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: CATEGORIES.map((category) =>Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: constraints.maxWidth * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/${category['image']}"),
                                      addVerticalSpace(10),
                                      Text("${category['name']}",
                                      style: textTheme.bodyText2!.apply(color: COLOR_BLACK),),
                                    ],
                                  ),
                                )
                              ) ).toList(),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
