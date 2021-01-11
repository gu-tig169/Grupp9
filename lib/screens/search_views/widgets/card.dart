import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: Denna satte jag i en mapp som hette components
class CustomCard extends StatelessWidget {
  final item;
  final image;
  final VoidCallback onTap;

  CustomCard(this.item, this.image, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((image + item[index].image)),
                            ))),
                    Positioned(
                        bottom: 0,
                        height: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                                height: 100,
                                width: 395,
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Text(
                                      item[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ))
                  ],
                )),
            onTap: () {
              this.onTap();
            },
          );
        });
  }
}
