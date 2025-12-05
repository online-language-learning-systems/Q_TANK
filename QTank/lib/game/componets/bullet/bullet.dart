import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Bullet extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Vector2 direction;

  Bullet({required this.direction})
      : super(size: Vector2.all(8), anchor: Anchor.center);

  @override
  void update(double dt) {
    position += direction * 300 * dt;

    if (position.x < 0 || position.x > 1000) removeFromParent();
  }
}
