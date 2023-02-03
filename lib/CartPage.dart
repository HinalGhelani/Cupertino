import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/GlobalVar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime currentDate = DateTime.now();
  List l = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 40,
                                child: const CupertinoTextField(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  placeholder: "Name",
                                  placeholderStyle: TextStyle(
                                      color: CupertinoColors.inactiveGray),
                                  style: TextStyle(
                                      color:
                                          CupertinoColors.darkBackgroundGray),
                                  prefix: Icon(
                                    CupertinoIcons.person_alt,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: CupertinoColors.systemGrey,
                              ),
                              Container(
                                height: 40,
                                child: const CupertinoTextField(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  placeholder: "Email",
                                  placeholderStyle: TextStyle(
                                      color: CupertinoColors.inactiveGray),
                                  style: TextStyle(
                                      color:
                                          CupertinoColors.darkBackgroundGray),
                                  prefix: Icon(
                                    CupertinoIcons.mail_solid,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: CupertinoColors.systemGrey,
                              ),
                              Container(
                                height: 40,
                                child: const CupertinoTextField(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  placeholder: "Location",
                                  placeholderStyle: TextStyle(
                                      color: CupertinoColors.inactiveGray),
                                  style: TextStyle(
                                      color:
                                          CupertinoColors.darkBackgroundGray),
                                  prefix: Icon(
                                    CupertinoIcons.location_solid,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: CupertinoColors.systemGrey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        CupertinoIcons.time,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Delivery Time",
                                        style: TextStyle(
                                            color: CupertinoColors.systemGrey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${l[currentDate.month - 1]} ${currentDate.day},${currentDate.year} ${currentDate.hour}:${currentDate.minute}",
                                    style: const TextStyle(
                                        color: CupertinoColors.systemGrey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 200,
                                child: CupertinoTheme(
                                  data: const CupertinoThemeData(
                                    textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: TextStyle(
                                        color: CupertinoColors.black,
                                      ),
                                    ),
                                  ),
                                  child: CupertinoDatePicker(
                                      backgroundColor: CupertinoColors.white,
                                      use24hFormat: false,
                                      initialDateTime: DateTime.now(),
                                      minimumYear: 2000,
                                      maximumYear: 2050,
                                      onDateTimeChanged: (val) {
                                        setState(() {
                                          currentDate = val;
                                        });
                                      }),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                  children: GlobalVar.cart.map((e) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Container(
                                    height: 60,
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${e['image']}"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e['name']}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: CupertinoColors
                                                        .systemGrey,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "\$${e['price']}",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: CupertinoColors
                                                        .inactiveGray,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Text(
                                                "\$${e['price']}",
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: CupertinoColors
                                                      .darkBackgroundGray,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    GlobalVar.cart.remove(e);
                                                  });
                                                },
                                                child: const Icon(
                                                  CupertinoIcons.clear,
                                                  color: CupertinoColors
                                                      .darkBackgroundGray,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList()),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: CupertinoColors.white,
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        height: 65,
                        width: double.infinity,
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Shipping \$${GlobalVar.shipping.toStringAsPrecision(3)}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            Text(
                              "Tax \$${GlobalVar.tax.toStringAsPrecision(3)}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            Text(
                              "Total  \$${GlobalVar.finalPrice.toStringAsPrecision(3)}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
