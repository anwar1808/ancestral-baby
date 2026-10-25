import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/media.dart';
import '../theme/tokens.dart';

/// Renders an [AppMedia] slot, auto-detecting image / video / embed (§6).
/// Swapping the underlying uri between an image and a video needs no code
/// change — this widget resolves the kind and picks the right renderer, and
/// falls back to a harmless placeholder when the asset is missing or empty.
class MediaView extends StatelessWidget {
  final AppMedia media;
  final double? height;
  final BoxFit fit;
  final BorderRadius? radius;

  const MediaView({
    super.key,
    required this.media,
    this.height,
    this.fit = BoxFit.cover,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (media.isEmpty) {
      child = const _Placeholder();
    } else {
      switch (media.resolvedKind) {
        case MediaKind.video:
          child = _VideoMedia(media: media, height: height);
          break;
        case MediaKind.embed:
          child = _EmbedMedia(media: media, height: height);
          break;
        case MediaKind.image:
        case MediaKind.auto:
          child = _ImageMedia(media: media, fit: fit);
          break;
      }
    }

    final wrapped = SizedBox(
      height: height,
      width: double.infinity,
      child: child,
    );
    if (radius == null) return wrapped;
    return ClipRRect(borderRadius: radius!, child: wrapped);
  }
}

class _ImageMedia extends StatelessWidget {
  final AppMedia media;
  final BoxFit fit;
  const _ImageMedia({required this.media, required this.fit});

  @override
  Widget build(BuildContext context) {
    switch (media.source) {
      case MediaSource.network:
        return CachedNetworkImage(
          imageUrl: media.uri,
          fit: fit,
          placeholder: (_, _) => const _Placeholder(loading: true),
          errorWidget: (_, _, _) => const _Placeholder(),
        );
      case MediaSource.file:
        final f = File(media.uri.replaceFirst('file://', ''));
        if (!f.existsSync()) return const _Placeholder();
        return Image.file(f, fit: fit,
            errorBuilder: (_, _, _) => const _Placeholder());
      case MediaSource.asset:
        return Image.asset(media.uri, fit: fit,
            errorBuilder: (_, _, _) => const _Placeholder());
    }
  }
}

class _VideoMedia extends StatefulWidget {
  final AppMedia media;
  final double? height;
  const _VideoMedia({required this.media, this.height});

  @override
  State<_VideoMedia> createState() => _VideoMediaState();
}

class _VideoMediaState extends State<_VideoMedia> {
  VideoPlayerController? _controller;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    final m = widget.media;
    try {
      switch (m.source) {
        case MediaSource.network:
          _controller = VideoPlayerController.networkUrl(Uri.parse(m.uri));
          break;
        case MediaSource.file:
          _controller =
              VideoPlayerController.file(File(m.uri.replaceFirst('file://', '')));
          break;
        case MediaSource.asset:
          _controller = VideoPlayerController.asset(m.uri);
          break;
      }
      _controller!.initialize().then((_) {
        if (mounted) setState(() {});
      }).catchError((_) {
        if (mounted) setState(() => _error = true);
      });
    } catch (_) {
      _error = true;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _controller;
    if (_error || c == null) return const _Placeholder(icon: Icons.videocam_off);
    if (!c.value.isInitialized) return const _Placeholder(loading: true);
    return GestureDetector(
      onTap: () => setState(() => c.value.isPlaying ? c.pause() : c.play()),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: c.value.size.width,
              height: c.value.size.height,
              child: VideoPlayer(c),
            ),
          ),
          if (!c.value.isPlaying)
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0x33000000),
              ),
              child: Center(
                child: Icon(Icons.play_circle_fill,
                    size: 56, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmbedMedia extends StatefulWidget {
  final AppMedia media;
  final double? height;
  const _EmbedMedia({required this.media, this.height});

  @override
  State<_EmbedMedia> createState() => _EmbedMediaState();
}

class _EmbedMediaState extends State<_EmbedMedia> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(_embedUrl(widget.media.uri)));
  }

  /// Normalise common share URLs into embeddable players.
  String _embedUrl(String raw) {
    final u = raw;
    final yt = RegExp(r'(?:youtu\.be/|youtube\.com/watch\?v=)([\w-]{11})')
        .firstMatch(u);
    if (yt != null) return 'https://www.youtube.com/embed/${yt.group(1)}';
    final vimeo = RegExp(r'vimeo\.com/(\d+)').firstMatch(u);
    if (vimeo != null) {
      return 'https://player.vimeo.com/video/${vimeo.group(1)}';
    }
    return u;
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}

class _Placeholder extends StatelessWidget {
  final bool loading;
  final IconData icon;
  const _Placeholder({this.loading = false, this.icon = Icons.restaurant});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.butter, AppColors.softBlue],
        ),
      ),
      child: Center(
        child: loading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(icon, size: 40, color: AppColors.navy.withValues(alpha: 0.35)),
      ),
    );
  }
}
