class ValidatePassword

  attr_reader :password

  def initialize(password)
    @password = password
  end

  def perform
    if (6..24).include?(@password.size) && @password.scan(/[a-z]/) && @password.scan(/\d/) && @password.scan(/A-Z/) && @password.scan(/\d/) && @password.scan(/[a-z]{1,2}/)
      true
    else
      false
    end

  end
end
