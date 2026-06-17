import 'app_config.dart';

class CloudinaryConfig {
  CloudinaryConfig._();

  static String get uploadUrl =>
      'https://api.cloudinary.com/v1_1/${AppConfig.cloudinaryCloudName}/auto/upload';

  static String get cloudName => AppConfig.cloudinaryCloudName;
  static String get uploadPreset => AppConfig.cloudinaryUploadPreset;

  static Map<String, String> get uploadBody => {
        'upload_preset': uploadPreset,
        'folder': 'dubbridge/uploads',
      };
}
