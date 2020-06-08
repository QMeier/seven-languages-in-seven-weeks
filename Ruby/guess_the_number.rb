#!/usr/bin/env ruby

begin
  done = false
  until done do
      x = rand(11)
      guess = false
      puts "Guess a number between 0 and 10, inclusive. \n"
      until guess do
        tmp = gets
        y = tmp.to_i
        puts 'Your guess is too high. Try again!' if y > x
        puts 'Your guess is too low. Try again!' if y < x
        if y == x
          puts "You got it! \n"
          guess = true
        end
      end

      puts 'Would you like to play again? (0/1)'
      tmp = gets
      if (tmp.to_i == 0)
        done = true
        puts "\n\n"
      end
  end
  puts "Thanks for playing! \n\n"
end
