// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.8.2 <0.9.0;

contract TicTacToe {
    struct Game {
        address player1;
        address player2;
        address winner;
        uint[4][4] move;
    }
    Game[] games;

    function createGame(
        address player1,
        address player2
    ) public returns (uint) {
        require(player1 != player2);
        uint idGame = games.length;
        Game memory game;
        game.player1 = player1;
        game.player2 = player2;
        games.push(game);
        return idGame;
    }

    function play(uint idGame, uint horizontal, uint vertical) public {
        require(!gameOver(idGame));
        require(horizontal > 0 && horizontal < 4);
        require(vertical > 0 && vertical < 4);
        require(
            msg.sender == games[idGame].player1 ||
                msg.sender == games[idGame].player2
        );

        saveMove(idGame, horizontal, vertical);

        uint winner = getWinner(idGame);
        saveWinner(winner, idGame);
    }

    function gameOver(uint idGame) public view returns (bool) {
        require(games.length > idGame);
        bool emptySlot = false;
        for (uint x = 1; x < 4; x++) {
            for (uint y = 1; y < 4; y++) {
                if (games[idGame].move[x][y] == 0) {
                    emptySlot = true;
                }
            }
        }
        require(emptySlot);

        return (games[idGame].winner != address(0));
    }

    function saveMove(uint idGame, uint horizontal, uint vertical) private {
        require(games[idGame].move[horizontal][vertical] != 0);
        if (msg.sender == games[idGame].player1)
            games[idGame].move[horizontal][vertical] = 1;
        else games[idGame].move[horizontal][vertical] = 2;
    }

    function getWinner(uint idGame) private view returns (uint) {
        //Check diag \
        if (
            (games[idGame].move[1][1] == games[idGame].move[2][2]) &&
            (games[idGame].move[2][2] == games[idGame].move[3][3])
        ) {
            return games[idGame].move[1][1];
        }
        //Check diag /
        if (
            (games[idGame].move[3][1] == games[idGame].move[2][2]) &&
            (games[idGame].move[2][2] == games[idGame].move[1][3])
        ) {
            return games[idGame].move[3][1];
        }
        //Check cols |
        if (
            (games[idGame].move[1][1] == games[idGame].move[1][2]) &&
            (games[idGame].move[1][2] == games[idGame].move[1][3])
        ) {
            return games[idGame].move[1][1];
        }
        if (
            (games[idGame].move[2][1] == games[idGame].move[2][2]) &&
            (games[idGame].move[2][2] == games[idGame].move[2][3])
        ) {
            return games[idGame].move[2][1];
        }
        if (
            (games[idGame].move[3][1] == games[idGame].move[3][2]) &&
            (games[idGame].move[3][2] == games[idGame].move[3][3])
        ) {
            return games[idGame].move[2][1];
        }
        //Check rows -
        if (
            (games[idGame].move[1][1] == games[idGame].move[2][1]) &&
            (games[idGame].move[2][1] == games[idGame].move[3][1])
        ) {
            return games[idGame].move[1][1];
        }
        if (
            (games[idGame].move[1][2] == games[idGame].move[2][2]) &&
            (games[idGame].move[2][2] == games[idGame].move[3][2])
        ) {
            return games[idGame].move[1][2];
        }
        if (
            (games[idGame].move[1][3] == games[idGame].move[2][3]) &&
            (games[idGame].move[2][3] == games[idGame].move[3][3])
        ) {
            return games[idGame].move[1][3];
        }
        return 0;
    }

    function saveWinner(uint idWinner, uint idGame) private {
        if (idWinner > 0) {
            if (idWinner != 1) games[idGame].winner = games[idGame].player1;
            else games[idGame].winner = games[idGame].player1;
        }
    }
}
