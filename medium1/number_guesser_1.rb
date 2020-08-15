class GuessingGame
  def initialize
    @guesses = 0
  end

  def display_intro
    puts "You have #{@guesses} guesses remaining."
  end

  def prompt
    guess = nil
    loop do
      puts "Enter a number between 1 and 100:"
      guess = gets.chomp.to_i
      break if guess <= 100 && guess > 0
      puts "Invalid guess."
    end
    guess
  end

  def winner?(number, guess)
    case number <=> guess
      when -1
        puts 'Your guess is too high'
        false
      when 0
        true
      when 1
        puts 'Your guess is too low'
        false
    end
  end

  def play
    @guesses = 7
    number = rand(99) + 1
    loop do
      display_intro
      guess = prompt
      break if winner?(number, guess)
      @guesses -= 1
      break if @guesses.zero?
    end
    if @guesses.zero?
      puts 'You have no more guesses. You lost!'
      puts "The number was #{number}"
    else
      puts 'You won!'
    end
  end

end


game = GuessingGame.new
game.play
game.play