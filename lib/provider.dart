import 'package:flutter/widgets.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc;

  Provider({
    Key key,
    Bloc bloc,
    Widget child,
  })  : bloc = bloc ?? Bloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(Provider) as Provider)
          .bloc;
}