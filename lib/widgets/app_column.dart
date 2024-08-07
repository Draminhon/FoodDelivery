import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/small_text.dart';

import '../pages/home/icon_and_text_widger.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int stars;
  final String location;
  const AppColumn({super.key, required this.text, this.stars = 5, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: text, size: Dimensions.font26,),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              stars,
                              (index) => const Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '4.5'),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '195'),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: 'comentários'),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                   const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                           text: "Normal",
                          iconColor: Colors.yellow,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '3.6km',
                          iconColor: Colors.blue,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: Colors.red,
                        )
                      ],
                    ),
                  ],
                );
  }
}