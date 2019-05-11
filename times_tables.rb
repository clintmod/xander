#!/usr/bin/env ruby


NUMBERS = [3,4,6,7,8,9,12]

correct_guesses = 0
incorrect_guesses = 0

def print_score(correct_guesses, incorrect_guesses)
  puts "\ncorrect = #{correct_guesses}, incorrect = #{incorrect_guesses}"
  score = 0
  if correct_guesses > 0 and incorrect_guesses > 0
    score = correct_guesses.to_f / (correct_guesses.to_f + incorrect_guesses.to_f) * 100.0  
  elsif incorrect_guesses == 0
    score = 100
  end
  puts "\nScore: #{score.to_i}%"
end

trap "SIGINT" do
  print_score(correct_guesses, incorrect_guesses)
  print "\n"
  exit 0
end

def prompt(*args)
    print(*args)
    gets
end

loop do

  first = NUMBERS.sample
  second = NUMBERS.sample

  start_time = Time.now
  answer = prompt("#{first} x #{second} = ").to_i
  time_diff = Time.now - start_time
  puts "Answered in: #{time_diff.round(1)}"
  if answer == first * second
    puts "Correct!"
    correct_guesses += 1
  else
    puts "Incorrect the answer was #{first * second}"
    incorrect_guesses += 1
  end
end
