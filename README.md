Overview
Mastermind is a classic code-breaking game played between two players. This Ruby implementation allows a player to play against the computer in two roles: as the code maker or the code breaker.

Features
Play as either the code maker or the code breaker.
Computer can guess the player's code using a refined strategy based on feedback.
Computer can create a secret code for the player to guess.
Turn-based gameplay with feedback provided after each guess.
Getting Started
Prerequisites
Ruby (version 2.7 or later recommended)
Installation
Clone the repository to your local machine:

bash
Copy code
git clone https://github.com/cancelei/ruby_mastermind_game.git
cd your-repository
Running the Game
Navigate to the game directory and run:

Copy code
ruby game.rb
How to Play
As Code Maker
Create a 4-digit code using numbers from 1 to 6.
The computer will attempt to break your code within 12 turns.
As Code Breaker
Guess the 4-digit code created by the computer.
After each guess, you'll receive feedback on exact and partial matches.
Try to break the code within 12 turns.
Contributing
Contributions to improve the game are welcome. Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit them (git commit -am 'Add some feature').
Push to the branch (git push origin feature-branch).
Create a new Pull Request.
License
This project is licensed under the MIT License.
