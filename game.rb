class Mastermind
  attr_reader :secret_code

  def initialize
    @turns = 12
    # choose_role
  end

  def start_game
    choose_role
  end

  def choose_role
    puts "Do you want to be the code creator or the guesser? (Enter 'creator' or 'guesser')"
    role = gets.chomp
    if role == 'creator'
      puts "Enter a secret code of four numbers (each between 1 and 6):"
      @secret_code = gets.chomp.split('').map(&:to_i)
      computer_guesser
    else
      @secret_code = Array.new(4) { rand(1..6) }
      human_guesser
    end
  end

  def play
    @turns.times do |turn|
      puts "Turn \#{turn + 1}: Enter your guess (e.g., 1234):"
      guess = gets.chomp.split('').map(&:to_i)
      feedback = check_guess(guess)
      puts "Exact matches: \#{feedback[:exact]}, Partial matches: \#{feedback[:partial]}"
      break if feedback[:exact] == 4
    end
    puts "Game over! The secret code was \#{@secret_code.join}"
  end

  def computer_guesser
    @turns.times do |turn|
      guess = generate_computer_guess
      feedback = check_guess(guess)
      puts "Turn: \ #{turn + 1}, Guess: \ #{guess}, Feedback: \ #{feedback}"
    end
  end

  def generate_computer_guess
    Array.new(4) { rand(1..6) }
  end

  def human_guesser
    @turns.times do |turn|
      puts "Turn \#{turn + 1}: Enter your guess (e.g., 1234):"
      guess = gets.chomp.split('').map(&:to_i)
      feedback = check_guess(guess)
      puts "Exact matches: \ #{feedback[:exact]}, Partial matches: \ #{feedback[:partial]}"
      break if feedback[:exact] == 4
    end
    puts "Game over! The secret code was \ #{@secret_code.join}"
  end


  private

  def check_guess(guess)
    exact_matches = guess.zip(@secret_code).count { |g, s| g == s }

    # Remove exact matches from guess and secret code for partial match calculation
    remaining_guess = guess.zip(@secret_code).reject { |g, s| g == s }.map(&:first)
    remaining_secret_code = @secret_code.reject.with_index { |_, i| guess[i] == @secret_code[i] }

    partial_matches = remaining_guess.count { |g| remaining_secret_code.include?(g) }

    clues = '●' * exact_matches + '○' * partial_matches
    { exact: exact_matches, partial: partial_matches, clues: clues }
  end
end

# uncomment line 79 before running Rspec tests.
game = Mastermind.new
# game.start_game
