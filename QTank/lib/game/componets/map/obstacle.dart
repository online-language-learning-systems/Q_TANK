import 'package:flame/components.dart';
import '../../tank_game.dart';

class Obstacle extends SpriteComponent with HasGameRef<TankGame> {
  final String spritePath;

  Obstacle({
    required this.spritePath,
    required Vector2 position,
    Vector2? size,
  }) : super(
    position: position,
    size: size ?? Vector2(64, 64),
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(spritePath);
  }
}
