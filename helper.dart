import 'dart:io';
import 'dart:math';

String prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync()!;
}

class Player {
  late int health;
  final int strength;
  final String name;

  Player({required this.health, required this.strength, required this.name});

  void attack(Monster enemy) {
    int damage = strength + Random().nextInt(10);
    enemy.health -= damage;
    print(
      '${name} attacked ${enemy.name} and deals $damage damage!',
    );
    print('${name} has ${health} health points left.');
    print('${enemy.name} has ${enemy.health} health points left.');
  }

  void takeDamage(Monster enemy) {
    int damage = enemy.strength + Random().nextInt(5);
    health -= damage;
    print(
      '${enemy.name} attacked ${name} and deals $damage damage!',
    );
    print('${name} has ${health} health points left.');
  }

  void heal(int amount) {
    health += amount;
    health = health > 100 ? 100 : health;
    print('${name} healed $amount health points!');
    print('${name} has ${health} health points left.');
  }
}

class Monster {
  late int health;
  final int strength;
  final String name;

  Monster({required this.strength, required this.name, required this.health});
}
