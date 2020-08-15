=begin
n Place a value n in the "register". Do not modify the stack.
  PUSH Push the register value on to the stack. Leave the value in the register.
  ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
  SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
  MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
  DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
  MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  POP Remove the topmost item from the stack and place in register
PRINT Print the register value
=end

class Minilang
  def initialize(commands)
    @register = 0
    @stack = []
    @command_queue = commands
  end

  def eval(parameter_swap = nil)
    format(@command_queue, parameter_swap).split(' ').each do |command|
      begin
        case command
          when 'PUSH'
            push
          when 'ADD'
            @stack.empty? ? stack_error : add
          when 'SUB'
            @stack.empty? ? stack_error : sub
          when 'MULT'
            @stack.empty? ? stack_error : mult
          when 'DIV'
            @stack.empty? ? stack_error : div
          when 'MOD'
            @stack.empty? ? stack_error : mod
          when 'POP'
            @stack.empty? ? stack_error : pop
          when 'PRINT'
            print
          when /\A[-+]?[0-9]+\z/
            number(command.to_i)
          else
            invalid_token(command)
        end
      end
    end
  end

  def stack_error
    raise 'Empty Stack!'
  end

  def invalid_token(operation)
    raise "Invalid token: #{operation}"
  end

  def push
    @stack << @register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    puts @register
  end

  def number(value)
    @register = value
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)


# Further exploration
CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

