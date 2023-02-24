# isbn13_verify

### isbn_verify.rb

A class that initializes with a 12 or 13 digit number and has a method to check the isbn number. If the number has 12 digits, the code returns the number with the correct check digit. If it is 13 digits, the code checks if the number is valid.

To run this file add in the code:

    test1 = Isbn13.new(9780143007234)
    puts test1.verify
    
And on terminal run:

    ruby ./isbn_verify.rb

### isbn_verify_spec.rb

Test file. In this file I test whether the initialized number is really a number, if it has more than 13 digits, if it has less than 12 digits, I check an invalid 13 digit number, I check a valid 13 digit number, and I check if the check digit is made with a 12 digit number.

Run the test:

    $ rspec ./isbn_verify_spec.rb
