import 'package:flutter/cupertino.dart';

class Utils{

}

extension UniversalMediaQuerySize on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  double get h => mq.size.height / 896;

  double get w => mq.size.width / 414;
}
