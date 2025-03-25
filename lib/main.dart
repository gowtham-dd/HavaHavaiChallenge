import 'dart:ui';
import 'package:cartproduct/provider/cartprovider.dart';
import 'package:cartproduct/screen/productpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Flutter Error: $error');
    return true;
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Ecom Product Cart',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: ProductPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
