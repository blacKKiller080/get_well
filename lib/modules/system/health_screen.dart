import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_well/core/helper/navigateable.dart';
import 'package:get_well/core/routes/routes.dart';

class HealthScreen extends StatefulWidget implements Navigateable {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();

  @override
  String getName() {
    return Routes.health_screen;
  }
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
