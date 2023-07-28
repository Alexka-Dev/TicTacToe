# TicTacToe
TicTacToe is a simple implementation of the classic Tic-Tac-Toe game as a Solidity smart contract. This contract allows players to create games and play against each other in a decentralized. The contract supports multiple  games and determines the winner based on the traditional rules of Tic-Tac-Toe.

## License
This project is licensed under the GNU General Public License v3.0.

## Requirements
Solidity version: >0.8.2 and <0.9.0

## Overview
The contract defines a TicTacToe contract with the following functionalities:

- createGame: Allows a player to create a new game by specifying the addresses of player1 and player2.
- play: Allows players to make their moves in the game by specifying the position (horizontal and vertical) where they want to place their mark (1 or 2).
- gameOver: Checks if the game is over by verifying if all slots on the game board are filled or if there is a winner.
- saveMove: Records the player's move on the game board.
- getWinner: Checks and determines the winner based on the current state of the game board.
- saveWinner: Saves the winner's address in the game state.

## How to Play
1- Deploy the TicTacToe smart contract on the Ethereum blockchain.
2- Player1 initiates the game by calling the createGame function, passing their address and the address of player2.
3- Players take turns calling the play function, providing the idGame, and the desired position on the game board represented by horizontal and vertical coordinates (both ranging from 1 to 3).
4- The contract will automatically determine the winner or declare a draw when the game is over.

## Contribution
Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the project's GitHub repository.

## Creators
This smart contract has been developed by Alexka (AlexkDev) Lovera.

Happy gaming!
