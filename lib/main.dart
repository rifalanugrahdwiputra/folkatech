import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folkatech/view/product_view.dart';
import 'package:get/get.dart';

import 'view/splash_screen_view.dart';
import 'view_model/product_view_model.dart';

Future<void> main() async {
  Get.put(ProductViewModel());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const FolkatechApps()),
  );
}

class FolkatechApps extends StatefulWidget {
  const FolkatechApps({super.key});

  @override
  State<FolkatechApps> createState() => _FolkatechAppsState();
}

class _FolkatechAppsState extends State<FolkatechApps> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: ProductView(),
            defaultTransition: Transition.cupertino,
          );
        }
        return const SplashScreenView();
      },
    );
  }
}
