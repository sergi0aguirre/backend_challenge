class Utils
  def self.random_string(length=10)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    string = ""
    length.times {|i| string << chars[rand(chars.size-1)]}
    string
  end

  def self.random_number(length=10)
    chars = ("0".."9").to_a
    string = ""
    length.times {|i| string << chars[rand(chars.size-1)]}
    string
  end

end