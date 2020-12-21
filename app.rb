require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!

  	get '/reversename/:name' do
		@user_name = params[:name]
		@user_name.reverse
	end

	get '/square/:number' do
		@user_number = params[:number].to_i
		squared = (@user_number ** 2).to_s	
	end

	get '/say/:number/:phrase' do
		@user_number = params[:number].to_i
		@user_phrase = params[:phrase]
		@user_phrase * @user_number
	end
	
	get '/say/:word1/:word2/:word3/:word4/:word5' do 
		str = ""
		params.each do |k, v|
			str += params[k] + ' '
		end
		str[0..-2] + '.'
	end

	get '/:operation/:number1/:number2' do
		math_syms = {'add' => '+', 'subtract' => '-', 'multiply' => '*', 'divide' => '/'}
		@operation_sym = math_syms[params[:operation]] #Gets symbol (+, -, *, /)
		@num1 = params[:number1].to_i; @num2 = params[:number2].to_i

		@num1.send(@operation_sym, @num2).to_s #Operates on the two numbers, and converts to string which is returned
		
	end

end