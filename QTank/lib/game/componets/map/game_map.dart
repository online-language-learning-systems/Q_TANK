import 'package:flame/components.dart';

class GameMap extends SpriteComponent with HasGameRef {
  final String mapFolder;

  GameMap({required this.mapFolder})
      : super(size: Vector2(1024, 768), anchor: Anchor.topLeft);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('$mapFolder/background.png');
  }
}
