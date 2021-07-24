import 'package:flutter/material.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController moreInfoController = TextEditingController();

  int _selectedIndex = 0;
  String dropdownValue = 'Alexandria';

  String x = "";
  List<String> cites = [
    'Alexandria',
    'Assiut',
    '	Aswan',
    'Beheira',
    'Bani Suef',
    'Cairo',
    'Daqahliya',
    'Damietta',
    'Fayyoum',
    'Gharbiya',
    'Giza',
    'Helwan',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Marsa Matrouh',
    'Minya',
    'Monofiya',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalioubiya',
    'Qena',
    'Red Sea',
    'Sharqiya',
    'Sohag',
    'South Sinai',
    'Suez',
    'Tanta',
  ];

  changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                        offset: Offset(0.7, 0.7)),
                  ],
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back),
                          Spacer(),
                          Center(
                            child: Text(
                              "Delivery Address",
                              style: bold20,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          deliveryTabContainer(
                              size: size,
                              containerColor: _selectedIndex == 0
                                  ? greenColor
                                  : Colors.white,
                              imageColor: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.grey,
                              onTap: () {
                                changeIndex(0);
                              },
                              imagePath: 'images/placeholder.png'),
                          deliveryTabContainer(
                              size: size,
                              containerColor: _selectedIndex == 1
                                  ? greenColor
                                  : Colors.white,
                              imageColor: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.grey,
                              onTap: () {
                                changeIndex(1);
                              },
                              imagePath: 'images/truck.png'),
                          deliveryTabContainer(
                              size: size,
                              containerColor: _selectedIndex == 2
                                  ? greenColor
                                  : Colors.white,
                              imageColor: _selectedIndex == 2
                                  ? Colors.white
                                  : Colors.grey,
                              onTap: () {
                                changeIndex(2);
                              },
                              imagePath: 'images/menu.png'),
                          deliveryTabContainer(
                              size: size,
                              containerColor: _selectedIndex == 3
                                  ? greenColor
                                  : Colors.white,
                              imageColor: _selectedIndex == 3
                                  ? Colors.white
                                  : Colors.grey,
                              onTap: () {
                                changeIndex(3);
                              },
                              imagePath: 'images/placeholder.png')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      deliveryTextForm(
                          controller: nameController, labelText: "Name"),
                      SizedBox(
                        height: 20,
                      ),
                      deliveryTextForm(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          labelText: "Phone"),
                      SizedBox(
                        height: 20,
                      ),
                      deliveryTextForm(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          labelText: "Email"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Country : Egypt",
                        style: bold20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: baseFormFillColor,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        width: 100,
                        child: DropdownButton<String>(
                          hint: Text("Select your city"),
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: cites
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      deliveryTextForm(
                          controller: streetController,
                          labelText: "Street Number"),
                      SizedBox(
                        height: 20,
                      ),
                      deliveryTextForm(
                          controller: moreInfoController,
                          labelText: "More Address information (optional)"),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
