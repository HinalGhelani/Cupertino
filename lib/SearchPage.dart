import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/GlobalVar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  int qun = 0;

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CupertinoColors.white,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 1,child: Container()),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 16,bottom: 21,left: 16,right: 16),
                    child: CupertinoSearchTextField(
                      controller: textController,
                      onChanged: (val){
                        GlobalVar.search = val;
                      },
                      placeholder: "Search",
                      padding: const EdgeInsets.all(10),
                      autocorrect: true,
                      itemColor: CupertinoColors.systemGrey,
                      style: const TextStyle(
                          color: CupertinoColors.darkBackgroundGray
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                        children: GlobalVar.l.map((e) {
                          return (GlobalVar.search != "")
                              ? (e['name'] == GlobalVar.search || e['category'] == GlobalVar.search.toLowerCase())
                                 ? Column(
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
                                          GlobalVar.shipping =
                                              GlobalVar.totalPrice * 0.06;
                                          GlobalVar.tax = GlobalVar.totalPrice * 0.05;
                                          GlobalVar.finalPrice = GlobalVar.totalPrice +
                                              GlobalVar.shipping + GlobalVar.tax;
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
                          )
                                 : Container()
                              : Column(
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
                                          GlobalVar.shipping =
                                              GlobalVar.totalPrice * 0.06;
                                          GlobalVar.tax = GlobalVar.totalPrice * 0.05;
                                          GlobalVar.finalPrice = GlobalVar.totalPrice +
                                              GlobalVar.shipping + GlobalVar.tax;
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
                              ),
                            ],
                          );
                        }).toList()

                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
