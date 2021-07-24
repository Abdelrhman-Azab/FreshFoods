import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/screens/product/cubit/states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStateInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<CartItem> cartItems = [];
}
