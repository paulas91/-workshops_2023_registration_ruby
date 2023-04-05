
class ValidatePassword
  VALIDATION_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%&*+=:;?<>])[A-Za-z\d!@#$%&*+=:;?<>]{6,24}$/
  private_constant :VALIDATION_REGEX

  def initialize(password)
    @password = password
  end

  def perform
    valid_regex? && valid_repetition?
  end

  private

  attr_reader :password

  def valid_regex?
    !!(password =~ VALIDATION_REGEX)
  end

  def valid_repetition?
    chars = password.chars
    !chars.find.with_index do |char, i|
      break if i == chars.count - 2

      [char, chars[i + 1], chars[i + 2]].uniq.count == 1
    end
  end
end
