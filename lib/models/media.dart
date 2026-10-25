/// Polymorphic, format-agnostic media value object (§6, §8).
///
/// A single field accepts an image, a local video, or an embed URL. The app
/// auto-detects the type from the URI's extension / host and renders the
/// correct widget — no "mode" toggle. A slot can be swapped image<->video at
/// any time without code changes.
enum MediaKind { auto, image, video, embed }

/// Where the uri points — bundled asset, local file on disk, or a remote URL.
enum MediaSource { asset, file, network }

class AppMedia {
  final MediaKind kind;
  final String uri;

  const AppMedia({this.kind = MediaKind.auto, required this.uri});

  static const AppMedia empty = AppMedia(uri: '');

  bool get isEmpty => uri.trim().isEmpty;

  /// Resolve `auto` to a concrete kind from the uri.
  MediaKind get resolvedKind {
    if (kind != MediaKind.auto) return kind;
    final lower = uri.toLowerCase();
    if (_isEmbedHost(lower)) return MediaKind.embed;
    if (_hasExt(lower, _videoExts)) return MediaKind.video;
    if (_hasExt(lower, _imageExts)) return MediaKind.image;
    // Bare http(s) that isn't a known media file → treat as an embed page.
    if (lower.startsWith('http')) return MediaKind.embed;
    return MediaKind.image;
  }

  MediaSource get source {
    final lower = uri.toLowerCase();
    if (lower.startsWith('http')) return MediaSource.network;
    if (lower.startsWith('assets/')) return MediaSource.asset;
    if (lower.startsWith('/') || lower.startsWith('file:')) {
      return MediaSource.file;
    }
    // Default seeded paths live under assets/.
    return MediaSource.asset;
  }

  static const _imageExts = ['.jpg', '.jpeg', '.png', '.webp', '.gif', '.heic'];
  static const _videoExts = ['.mp4', '.mov', '.m4v', '.webm'];

  static bool _hasExt(String s, List<String> exts) {
    // Strip query string before checking extension.
    final clean = s.split('?').first;
    return exts.any(clean.endsWith);
  }

  static bool _isEmbedHost(String s) {
    return s.contains('youtube.com') ||
        s.contains('youtu.be') ||
        s.contains('vimeo.com') ||
        s.contains('player.vimeo');
  }
}
