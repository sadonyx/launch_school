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
  num.is_a?(Integer) || num.is_a?(Float)
end

prompt('welcome')

go_again = 'y'
while go_again.downcase().start_with?('y')
  number1 = ''
  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

  operator = ''
  prompt('operator_prompt')
  loop do
    operator = Kernel.gets().chomp().to_i

    if [1,2,3,4].include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, 4")
    end
  end

  result = case operator
  when 1 then number1 + number2
  when 2 then number1 - number2
  when 3 then number1 * number2
  when 4 then number1.to_f / number2.to_f
  else
    prompt("Incorrect input.")
  end

  prompt("The result is #{result}.")

  prompt('another_calc')
  go_again = Kernel.gets().chomp().downcase
end

prompt('thank_you')