import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/GlobalVar.dart';

import 'GlobalVar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int qun = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      resizeToAvoidBottomInset: false,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                // height: 150,
                color: CupertinoColors.systemGrey2.withOpacity(0.3),
                alignment: Alignment.bottomLeft,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Cupertino Store",
                    style: TextStyle(
                        fontSize: 25,
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: GlobalVar.l.map((e) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.inactiveGray
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage("${e['image']}"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${e['name']}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "\$${e['price']}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: CupertinoColors.inactiveGray,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                    setState(() {
                                      GlobalVar.cart.add(e);
                                      qun = e['i']++;
                                      e['total'] = int.parse(e['price']) * qun;
                                      GlobalVar.totalPrice += e['total'];
                                      GlobalVar.shipping = GlobalVar.totalPrice * 0.06;
                                      GlobalVar.tax = GlobalVar.totalPrice * 0.05;
                                      GlobalVar.finalPrice = GlobalVar.totalPrice + GlobalVar.shipping + GlobalVar.tax;
                                    });
                                },
                                child: const Icon(
                                  CupertinoIcons.add_circled,
                                  color: CupertinoColors.link,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          height: 0.7,
                          color: CupertinoColors.inactiveGray,
                          indent: 85,
                          thickness: 0.9,
                        )
                      ],
                    );
                  }).toList()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
