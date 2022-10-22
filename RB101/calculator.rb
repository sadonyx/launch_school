require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

prompt('welcome')

go_again = 'y'
while go_again.downcase().start_with?('y')
  number1 = ''
  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    if number?(number1)
      number1 = float?(number1) ? number1.to_f : (integer?(number1) ? number1.to_i : nil)
      break
    else
      prompt('valid_number')
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()

    if number?(number2)
      number2 = float?(number2) ? number2.to_f : (integer?(number2) ? number2.to_i : nil)
      break
    else
      prompt('valid_number')
    end
  end

  dividing_by_zero = true # We assume it is true until proven it is not.
  until dividing_by_zero == false

    operator = ''
    prompt('operator_prompt')
    loop do
      operator = Kernel.gets().chomp().to_i

      if [1,2,3,4].include?(operator)
        break
      else
        prompt("must_choose")
      end
    end

    result = case operator
    when 1 then
      dividing_by_zero = false 
      number1 + number2
    when 2 then
      dividing_by_zero = false 
      number1 - number2
    when 3 then
      dividing_by_zero = false 
      number1 * number2
    when 4
      if number2 != 0
        dividing_by_zero = false
        number1.to_f / number2.to_f
      else
        prompt("divide_by_zero")
      end
    else
      prompt("incorrect_operator")
    end
  end

  puts ("=> The result is #{result}.")

  prompt('another_calc')
  go_again = Kernel.gets().chomp().downcase
end

prompt('thank_you')