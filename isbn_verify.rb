class Isbn13
  def initialize(isbn_number)
    @isbn_number = isbn_number
    raise TypeError, "Expected a number!" unless (@isbn_number.class == Integer)
    raise ArgumentError, "The number have more than 13 digits!" if @isbn_number.to_s.size > 13
    raise ArgumentError, "The number have less than 12 digits!" if @isbn_number.to_s.size < 12
  end

  def verify
    sum = 0
    @isbn_number.to_s.chars.each_with_index do |digit, index|
      weight = index % 2 == 0 ? 1 : 3
      sum += digit.to_i * weight
    end
    @isbn_number.to_s.size == 13 ? (sum % 10 == 0 ? 'VALID' : 'INVALID') : (@isbn_number.to_s << (10 - (sum % 10)).to_s).to_i
  end
end
