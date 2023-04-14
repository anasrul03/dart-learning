import 'dart:math';
import 'assist.dart';

void main() {
  String playerName = prompt('Enter your name: ');
  print('Welcome to the game, $playerName!');

  Character player = Player(health: 100, strength: 10, name: playerName);
  Character dragon = Monster(strength: 30, name: 'Dragon', health: 40);

  bool isRunning = true;

  print('Your opponent is ${dragon.name}.');

  while (isRunning) {
    print('What do you want to do? (attack/heal)');
    String choice = prompt('> ');
// PLayer decision
    switch (choice.toLowerCase()) {
      case 'attack':
      case 'a':
        player.attack(dragon);
        break;
      case 'heal':
      case 'h':
        (player as Player).heal(10);
        break;
      default:
        print('Invalid choice. Try again.');
    }
// Monster and Player Health STATUS
    if (!dragon.isAlive) {
      print('Congratulations, ${player.name}! You won!');
      isRunning = false;
    } else {
      dragon.attack(player);

      if (!player.isAlive) {
        print('Sorry, ${player.name}. You lost.');
        isRunning = false;
      }
    }
  }

  print('Thanks for playing!');
}
