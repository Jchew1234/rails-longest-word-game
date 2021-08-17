require 'open-uri'

class GamesController < ApplicationController
  def new
    characters = ('A'..'Z').to_a
    @letters = characters.sample(10) # this is an array

    # raise
  end

  def score
    @answer = params['answer'].upcase # returns a string
    @user_answer = @answer.split('')
    # raise
    # generated letter in string format, converted to array
    @generated_letters = params['letters']
    @generated_letters_array = @generated_letters.split('')
    # change answers from string to array

    check_english = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{@answer}").read)
    # this returns {"found"=> true, "word"=> "use", "length"=> 3} when user type in 'USE'

    # check if answer is included in the grid
    check_grid = @user_answer.all? { |letter| @generated_letters_array.include? letter}
    # raise

    # answer can't be built from original grid
    if check_grid == false
      @result = 1
    elsif (check_grid == true) && (check_english['found'])
      @result = 3
    else
      @result = 2
    end

    # answer is valid according to grid, but not valid english word

    # binding.pry

    # get API to check if word is valid english word.

    # answer is valid on both grid and is an English word
  end
end
