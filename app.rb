require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    "#{params[:name].reverse}"
  end

  get '/square/:number' do
    sq = params[:number].to_i * params[:number].to_i
    "#{sq}"
  end

  get '/say/:number/:phrase' do
    answer = ''
    n = params[:number].to_i
    n.times do  
      answer += params[:phrase]
    end
    answer
   end

  # get '/say/:word1/:word2/:word3/:word4/:word5' do
  #   "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  # end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    values = params.map(|key, value| value)
    values.join(" ")
    values += "."
  end
    
  get '/:operation/:number1/:number2' do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i

    answer = 'Unable to perform this operation'

    case params[:operation]
    when 'add'
      answer = (number1 + number2).to_s
    when 'subtract'
      answer = (number1 - number2).to_s
    when 'multiply'
      answer = (number1 * number2).to_s
    when 'divide'
      answer = (number1 / number2).to_s
    end
  end


  
end