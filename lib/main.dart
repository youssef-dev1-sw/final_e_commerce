import 'package:final_e_commerce/views/loginbage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://zgbenkuzyjsyiygyogme.supabase.co",
    publishableKey: "sb_publishable_W8WLzNkkzkdiP40dfTPZ4A_je2LseoG",
  );
  runApp(ProviderScope(child: const MyApp()));  
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(home: LoginPage());
  }
}
