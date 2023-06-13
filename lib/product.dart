import 'package:basicfoodapp/constants.dart';
import 'package:basicfoodapp/function.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final Map<String,dynamic> productData;
  final double width;

  const Product({super.key, required this.productData, required this.width});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme=Theme.of(context).textTheme;
    final height=width * 4/3;
    return Container(
      margin: EdgeInsets.only(right:20),
      width: width,
      height: height +40,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container(),),
              Expanded(
                flex:3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset("assets/images/${productData['image']}",
                  width: width* 0.80,
                  ),
                ),
                Expanded(child: Center()),
                Text("${productData['name']}",style: textTheme.headline6,),
                addVerticalSpace(5),
                RichText(text:  TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(Icons.location_on,color: Colors.red,size: 15,)),
                    TextSpan(text: "${productData['rest']}",style: textTheme.caption),
                  ]
                )),
                addVerticalSpace(15),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child:RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              WidgetSpan(child: Icon(Icons.star,color: COLOR_ORANGE,size:15,)),
                              TextSpan(
                                text: "${productData['rating']}",
                                style: textTheme.subtitle2!.apply(fontWeightDelta: 4)
                              )
                            ]
                          ),
                        )
                    ),
                    Expanded(
                        flex: 5,
                        child:RichText(
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "\$",
                                    style: textTheme.subtitle2!.apply(fontWeightDelta: 4)
                                ),
                                TextSpan(
                                    text: "${productData['price']}",
                                    style: textTheme.subtitle2!.apply(color: COLOR_ORANGE),
                                )
                              ]
                          ),
                        )
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
