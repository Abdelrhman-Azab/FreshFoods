abstract class OrderStates {}

class OrderStateInitial extends OrderStates {}

class OrderStateLoading extends OrderStates {}

class OrderStateSuccess extends OrderStates {}

class OrderStateFailed extends OrderStates {}

class OrderStateClear extends OrderStates {}

class OrderStateExpanded extends OrderStates {}
