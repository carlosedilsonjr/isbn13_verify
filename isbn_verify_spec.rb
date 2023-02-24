require_relative 'isbn_verify'

RSpec.describe "Isbn13 Verify" do
  it "return TypeError when initialize with string" do
    isbn = '978014300723'
    expect{Isbn13.new(isbn)}.to raise_error(TypeError)
  end

  it "return ArgumentError when initialize with more than 13 digits" do
    isbn = 97801430072345
    expect{Isbn13.new(isbn)}.to raise_error(ArgumentError)
  end

  it "return ArgumentError when initialize with less than 12 digits" do
    isbn = 97801430072
    expect{Isbn13.new(isbn)}.to raise_error(ArgumentError)
  end

  it "returns VALID for a valid ISBN-13" do
    isbn = 9783161484100
    expect(Isbn13.new(isbn).verify).to eq('VALID')
  end

  it "returns INVALID for an invalid ISBN-13" do
    isbn = 9783161484101
    expect(Isbn13.new(isbn).verify).to eq('INVALID')
  end

  it "returns the check digit for a 12 digits number" do
    isbn = 978014300723
    expect(Isbn13.new(isbn).verify).to eq(9780143007234)
  end
end
