MAX_LENGTH = 60

class Banner
  def initialize(message, user_banner_length = nil)

    @message_length = message.length
    @message = message
    @user_banner_length = user_banner_length
    if user_banner_length
      if @user_banner_length < @message_length
        @user_banner_length = @message_length
      elsif @user_banner_length > MAX_LENGTH
        @user_banner_length = MAX_LENGTH
      end
    end

  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    if @user_banner_length
      "+#{'-' * (@user_banner_length + 2)}+"
    else
      "+#{'-' * (@message_length + 2)}+"
    end

  end

  def empty_line
    if @user_banner_length
      "|#{' ' * (@user_banner_length + 2)}|"
    else
      "|#{' ' * (@message_length + 2)}|"
    end
  end

  def message_line
    if @user_banner_length
      spacing = ((@user_banner_length - @message_length) / 2) + 1
      "|#{' ' * spacing}#{@message}#{' ' * spacing}|"



    else
      "| #{@message} |"
    end

  end
end


banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 80)
puts banner



