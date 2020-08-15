class GuessingGame
  def initialize(lower_range, upper_range)
    @guesses = 0
    @lower_range = lower_range
    @upper_range = upper_range
    @number = nil
  end

  def reset
    @guesses = Math.log2(@upper_range - @lower_range).to_i + 1
    @number = rand(@lower_range..@upper_range)
  end

  def display_intro
    puts "You have #{@guesses} guesses remaining."
  end

  def prompt
    guess = nil
    loop do
      puts "Enter a number between #{@lower_range} and #{@upper_range}:"
      guess = gets.chomp.to_i
      break if guess <= @upper_range && guess > @lower_range
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
    reset
    loop do
      display_intro
      guess = prompt
      break if winner?(@number, guess)
      @guesses -= 1
      break if @guesses.zero?
    end
    if @guesses.zero?
      puts 'You have no more guesses. You lost!'
      puts "The number was #{@number}"
    else
      puts 'You won!'
    end
  end

end


game = GuessingGame.new(501, 1500)
game.play
game.play