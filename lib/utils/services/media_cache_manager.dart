import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MediaCacheManager {
  static Future<FileInfo?> checkCacheForUrl(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  static void cacheForUrl(String url) async {
    await DefaultCacheManager()
        .getSingleFile(url)
        .then((value) => print('downloaded successfully done for $url'));
  }
}
