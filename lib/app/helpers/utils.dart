import 'package:get/get.dart';

typedef BindingCreator<S extends Bindings> = S Function();

class Utils {
  Utils._();

  static late final List<BindingCreator<Bindings>> _navBarBindings;

  static void initializedNavBar({required List<Bindings> bindings}) {
    _navBarBindings = bindings.map((binding) => () => binding).toList();
  }

  static void loadNavBarBinding(int index) {
    final bindingCreator = _navBarBindings[index].call();
    bindingCreator.dependencies();
  }

  static void closeNavBar(int index) {
    final bindingCreator = _navBarBindings[index].call();
    bindingCreator.dependencies();
  }
}
