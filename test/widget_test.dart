// Smoke tests for Baby Solids.
import 'package:flutter_test/flutter_test.dart';

import 'package:baby_solids/models/media.dart';

void main() {
  test('AppMedia auto-detects media kind from uri', () {
    expect(const AppMedia(uri: 'assets/foods/egg_hero.jpg').resolvedKind,
        MediaKind.image);
    expect(const AppMedia(uri: '/tmp/clip.mp4').resolvedKind, MediaKind.video);
    expect(const AppMedia(uri: 'https://youtu.be/abcdef12345').resolvedKind,
        MediaKind.embed);
    expect(const AppMedia(uri: 'https://vimeo.com/123456').resolvedKind,
        MediaKind.embed);
  });

  test('AppMedia resolves source correctly', () {
    expect(const AppMedia(uri: 'assets/x.jpg').source, MediaSource.asset);
    expect(const AppMedia(uri: '/data/x.jpg').source, MediaSource.file);
    expect(const AppMedia(uri: 'https://x.com/a.jpg').source,
        MediaSource.network);
  });
}
