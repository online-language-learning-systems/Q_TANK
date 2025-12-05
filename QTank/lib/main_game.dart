import 'package:flame/game.dart';
import 'package:qtank/game/componets/map/game_map.dart';
import 'package:qtank/game/componets/map/obstacle.dart';
import 'package:qtank/game/componets/tank/tank.dart';

class TankGame extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    // Load map
    add(GameMap(mapFolder: 'maps/desert'));

    // Add obstacles
    add(Obstacle(
      spritePath: 'maps/desert/obstacles/rock.png',
      position: Vector2(300, 300),
    ));

    add(Obstacle(
      spritePath: 'maps/desert/obstacles/sand_dune.png',
      position: Vector2(500, 200),
    ));

    // Add player tanks
    add(Tank(position: Vector2(200, 300))); // Player 1
    add(Tank(position: Vector2(600, 300))); // Player 2
  }
}
