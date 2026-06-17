class AppConfig {
  AppConfig._();

  // === ENVIRONMENT ===
  static const bool isProduction = false;
  static const bool enableLogs = true;

  // === SUPABASE ===
  // ⚠️ YOU WILL FILL THESE AFTER SUPABASE SETUP
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';

  // === CLOUDINARY ===
  // ⚠️ YOU WILL FILL THESE AFTER CLOUDINARY SETUP
  static const String cloudinaryCloudName = 'YOUR_CLOUD_NAME';
  static const String cloudinaryUploadPreset = 'dubbridge_preset';
  static const String cloudinaryApiUrl =
      'https://api.cloudinary.com/v1_1/YOUR_CLOUD_NAME/auto/upload';

  // === CLOUDFLARE ===
  // ⚠️ YOU WILL FILL THIS AFTER CLOUDFLARE WORKER SETUP
  static const String cloudflareWorkerUrl = 'YOUR_CLOUDFLARE_WORKER_URL';

  // === PROCESSING ===
  static const int chunkDurationSeconds = 20;
  static const int maxFileSizeMB = 200;
  static const int processingTimeoutSeconds = 300;
}
