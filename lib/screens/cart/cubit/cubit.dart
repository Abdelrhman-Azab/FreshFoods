import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/cart/cubit/states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStateInitial());
}
