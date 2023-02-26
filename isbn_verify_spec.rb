require_relative 'isbn_verify'

RSpec.describe "Isbn13" do
  subject { Isbn13.new(isbn) }

  context "when initialize with string" do
    let(:isbn) { '9780143007235' }

    it "throws TypeError" do
      expect{subject}.to raise_error(TypeError)
    end
  end

  context "when initialize with more than 13 digits" do
    let(:isbn) { 97801430072345 }

    it "throws ArgumentError" do
      expect{subject}.to raise_error(ArgumentError)
    end
  end

  context "when initialize with less than 12 digits" do
    let(:isbn) { 97801430072 }

    it "throws ArgumentError" do
      expect{subject}.to raise_error(ArgumentError)
    end
  end

  context "when initialize with a valid 13 digits number" do
    let(:isbn) { 9780143007234 }

    it "returns VALID" do
      expect(subject.verify).to eq('VALID')
    end
  end

  context "when initialize with an invalid 13 digits number" do
    let(:isbn) { 9780143007235 }

    it "returns INVALID" do
      expect(subject.verify).to eq('INVALID')
    end
  end

  context "when initialize with a 12 digits number" do
    let(:isbn) { 978014300723 }  

    it "returns the same number with the check digit as last digit" do
      expect(subject.verify).to eq(9780143007234)
    end
  end
end
