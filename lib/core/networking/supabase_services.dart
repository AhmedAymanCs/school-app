import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  static final String url = dotenv.env['SUPABASE_URL'] ?? '';
  static final String apiKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  static Future<void> initSupabase() async {
    await Supabase.initialize(url: url, anonKey: apiKey);
  }
}
