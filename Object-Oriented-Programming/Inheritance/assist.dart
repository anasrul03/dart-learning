import 'dart:io';
import 'dart:math';

String prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync()!;
}

abstract class BaseCharacter {
  void attack(Character character);
  bool isAlive();
}

class Character implements BaseCharacter {
  late int health;
  final int strength;
  final String name;

  bool isAlive() {
    return health <= 0;
  }

  Character({required this.strength, required this.name, required this.health});

  void attack(Character character) {
    int damage = strength + Random().nextInt(10);
    character.health -= damage;
    print(
      '${name} attacked ${character.name} and deals $damage damage!',
    );
    print('${name} has ${health} health points left.');
    print('${character.name} has ${character.health} health points left.');
  }
}

class Player extends Character {
  Player({required super.health, required super.strength, required super.name});

  void heal(int amount) {
    health += amount;
    health = health > 100 ? 100 : health;
    print('${name} healed $amount health points!');
    print('${name} has ${health} health points left.');
  }
}

class Monster extends Character {
  Monster(
      {required super.strength, required super.name, required super.health});
}
