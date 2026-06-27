import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Picks a photo from the gallery or camera and copies it into the app's
/// documents directory so it persists (the picker's temp path does not).
/// Returns the saved absolute path, or null if the user cancelled.
class PhotoService {
  PhotoService._();
  static final PhotoService instance = PhotoService._();

  final ImagePicker _picker = ImagePicker();

  Future<String?> pick(ImageSource source) async {
    final picked = await _picker.pickImage(
      source: source,
      maxWidth: 1200,
      maxHeight: 1200,
      imageQuality: 85,
    );
    if (picked == null) return null;
    final dir = await getApplicationDocumentsDirectory();
    final foodDir = Directory(p.join(dir.path, 'custom_foods'));
    if (!foodDir.existsSync()) foodDir.createSync(recursive: true);
    final ext = p.extension(picked.path).isEmpty
        ? '.jpg'
        : p.extension(picked.path);
    final dest = p.join(
        foodDir.path, '${DateTime.now().microsecondsSinceEpoch}$ext');
    await File(picked.path).copy(dest);
    return dest;
  }
}
