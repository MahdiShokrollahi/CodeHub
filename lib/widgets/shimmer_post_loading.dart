import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPostLoading extends StatelessWidget {
  const ShimmerPostLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color(0xff1C1F2E),
                            border: Border.all(
                                color: themeData.colorScheme.primary, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 7,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 7,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Image.asset('images/icon_menu.png')
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  height: 440,
                  width: 394,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ],
            )));
  }
}
