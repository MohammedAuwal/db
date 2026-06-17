import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppHelpers {
  AppHelpers._();

  static Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.completed;
      case 'processing':
        return AppColors.processing;
      case 'uploading':
        return AppColors.uploading;
      case 'failed':
        return AppColors.failed;
      default:
        return AppColors.textMuted;
    }
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
    }
    return '${(bytes / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
  }

  static String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  static String timeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return 'Yesterday';
  }

  static bool isAudioFile(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['mp3', 'wav', 'm4a', 'aac', 'ogg', 'flac'].contains(ext);
  }

  static bool isVideoFile(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['mp4', 'mov', 'avi', 'mkv', 'webm'].contains(ext);
  }

  static String srtTimestamp(double seconds) {
    final ms = (seconds * 1000).toInt();
    final h = ms ~/ 3600000;
    final m = (ms % 3600000) ~/ 60000;
    final s = (ms % 60000) ~/ 1000;
    final millis = ms % 1000;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')},'
        '${millis.toString().padLeft(3, '0')}';
  }
}
