import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/delivery_address/cubit/states.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/shared/network/remote/firebase.dart';

class DeliveryCubit extends Cubit<DeliveryStates> {
  DeliveryCubit() : super(DeliveryStateInitial());

  static DeliveryCubit get(context) => BlocProvider.of(context);

  int selectedDeliveryIndex = 0;

  int selectedPaymentMethod = 0;

  int selectedIndex = 0;

  String dropdownValue = 'Alexandria';

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

  changeDropDownValue(String? newValue) {
    {
      dropdownValue = newValue!;
      emit(DeliveryStateChangeDropDown());
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController moreInfoController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryDateController = TextEditingController();
  TextEditingController cardSecurityCodeController = TextEditingController();

  changeDeliveryIndex(int index) {
    selectedDeliveryIndex = index;
    emit(DeliveryStateOptionView());
  }

  changePaymentIndex(int index) {
    selectedPaymentMethod = index;
    emit(DeliveryStatePaymentView());
  }

  changeIndex(int index) {
    selectedIndex = index;
    emit(DeliveryStateTitletView());
  }

  List products = [];

  placeOrder(BuildContext context) {
    ShopCubit.get(context).cartItems.values.forEach((cartItem) {
      products.add(cartItem.toJson());
    });
    emit(DeliveryStateOrderLoading());
    FirebaseFirestore.instance.collection("orders").doc(uid).update({
      "orders": FieldValue.arrayUnion([
        {
          "id": uid,
          "name": nameController.text,
          "governorate": dropdownValue,
          "city": cityController.text,
          "street": streetController.text,
          "moreInfos": moreInfoController.text,
          "phone": phoneController.text,
          "deliverytype": "free",
          "email": user!.email,
          "Payment": "CashOnDelivery",
          "totalPrice": ShopCubit.get(context).totalPrice,
          "date": DateTime.now(),
          "products": products,
        }
      ])
    }).then((value) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set({"cart": []}).then((value) {
        ShopCubit.get(context).cartItems.clear();
        emit(DeliveryStateOrderSuccess());
      });
    }).onError((error, stackTrace) {
      print(error);
      emit(DeliveryStateOrderFailed());
    });
  }

  bool firstCheck(BuildContext context) {
    if (nameController.text.isEmpty) {
      showSnackBar(context: context, message: "Please write your name");
      return false;
    }
    if (phoneController.text.isEmpty) {
      showSnackBar(context: context, message: "Please write your phone number");
      return false;
    }
    if (phoneController.text.length < 10) {
      showSnackBar(
          context: context, message: "Please write a correct phone number");
      return false;
    }

    if (cityController.text.isEmpty) {
      showSnackBar(context: context, message: "Please write your city");
      return false;
    }
    if (streetController.text.isEmpty) {
      showSnackBar(context: context, message: "Please write your address");
      return false;
    }
    return true;
  }
}
