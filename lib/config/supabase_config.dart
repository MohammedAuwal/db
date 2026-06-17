import 'package:supabase_flutter/supabase_flutter.dart';
import 'app_config.dart';

class SupabaseConfig {
  SupabaseConfig._();

  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: AppConfig.supabaseUrl,
      anonKey: AppConfig.supabaseAnonKey,
    );
  }

  // === TABLE REFERENCES ===
  static SupabaseQueryBuilder get projectsTable =>
      client.from('projects');

  static SupabaseQueryBuilder get transcriptsTable =>
      client.from('transcripts');

  static SupabaseQueryBuilder get translationsTable =>
      client.from('translations');

  static SupabaseQueryBuilder get profilesTable =>
      client.from('profiles');

  // === REALTIME ===
  static RealtimeChannel projectChannel(String projectId) =>
      client.channel('project_$projectId');
}
