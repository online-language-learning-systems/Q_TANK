import 'package:flame/components.dart';
import 'package:qtank/game/tank_game.dart';

class Tank extends PositionComponent with HasGameRef<TankGame> {
  late SpriteComponent hull;
  late SpriteComponent turret;
  late SpriteComponent tracks;

  Tank({
    required Vector2 position,
  }) : super(
    position: position,
    size: Vector2(64, 64),
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Load sprite trong assets
    final hullSprite = await gameRef.loadSprite(
      'tanks/Hulls/Hulls_Color_A/Hull_01.png',
    );

    final turretSprite = await gameRef.loadSprite(
      'tanks/Turret/Weapon_Color_A/Gun_01.png',
    );

    final tracksSprite = await gameRef.loadSprite(
      'tanks/Tracks/Track_1_B.png',
    );



    tracks = SpriteComponent(
      sprite: tracksSprite,
      size: size,
      anchor: Anchor.center,
    );

    hull = SpriteComponent(
      sprite: hullSprite,
      size: size,
      anchor: Anchor.center,
    );

    turret = SpriteComponent(
      sprite: turretSprite,
      size: size,
      anchor: Anchor.center,
      position: Vector2(0, -10), // đẩy nòng ra trước
    );

    add(tracks);
    add(hull);
    add(turret);
  }

  void rotateHull(double angle) {
    this.angle = angle;
  }

  void rotateTurret(double angle) {
    turret.angle = angle;
  }
}
