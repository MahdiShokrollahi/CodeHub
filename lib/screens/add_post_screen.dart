import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/constants/constant.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var listItems = ['Take', 'Gallary', 'Draft'];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [_getHeaderSection(themeData), _getPostBox()],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(right: 18, left: 18, bottom: 20),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        height: 128,
                        width: 128,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              'images/post$index.png',
                              fit: BoxFit.cover,
                            )),
                      );
                    }, childCount: 9),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5)),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: 83,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(17, 10, 17, 57),
                decoration: BoxDecoration(
                    color: Color(0xff272B40),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        listItems.length,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedItem = index;
                                });
                              },
                              child: Text(
                                listItems[index],
                                style: themeData.textTheme.button!.copyWith(
                                    color: selectedItem == index
                                        ? primaryColor
                                        : Colors.white),
                              ),
                            ))
                  ],
                )),
          )
        ],
      )),
    );
  }

  Widget _getPostBox() {
    return Container(
      height: 394,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/Rectangle 53.png'))),
    );
  }

  Widget _getHeaderSection(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 27),
      child: Row(
        children: [
          Text(
            'Post',
            style: themeData.textTheme.headline6,
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/Vector.png'),
          Spacer(),
          Text(
            'Nex',
            style: themeData.textTheme.headline6,
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/icon2.png')
        ],
      ),
    );
  }
}
