require 'yaml'
MESSAGES = YAML.load_file('mortgage_prompts.yml')

# 3 INPUTS NEEDED
# 1. the loan amount
# 2. the Annual Percentage Rate (APR)
# 3. the loan duration

# 3 CALCULATIONS NEEDED
# 1. monthly interest rate
# 2. loan duration (in months)
# 3. monthly payment

# formula : m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment ; p = loan amount ; j = monthly interest rate ; n = loan duration in months

# format strings from yml
def prompt(key)
  puts("=> #{MESSAGES[key]}")
end

# validate input to be integer -> return true
def integer?(num)
  num == num.to_i.to_s
end

# validate input to be float -> return true
def float?(num)
  num == num.to_f.to_s
end

# number is valid if either is true
def number?(num)
  integer?(num) || float?(num)
end

def to_number(num)
  float?(num) ? num.to_f : (integer?(num) ? num.to_i : nil)
end

def monthly_payment(p, j, n)
  sprintf('%.2f', (p * (j / (1 - (1 + j)**(-n))))) # Returns monthly total (nearest 2 decimal places)
end

prompt("welcome")
loan_amount = ''
loop do
  prompt("loan_amount")
  loan_amount = gets.chomp
  if number?(loan_amount)
    loan_amount = to_number(loan_amount)
    break
  else
    prompt("valid_number")
  end
end

loan_apr = ''
loop do
  prompt("apr_amount")
  loan_apr = gets.chomp
  if number?(loan_apr)
    loan_apr = to_number(loan_apr).to_f / 100 / 12  # Convert from percent form to decimal form ( / 100 ); Convert from yearly to monthly ( / 12 )
    break
  else
    prompt("valid_number")
  end
end

loan_duration_months = ''
loop do
  prompt("loan_duration")
  loan_duration_months = gets.chomp
  if number?(loan_duration_months)
    loan_duration_months = to_number(loan_duration_months) * 12 # Convert years to months
    break
  else
    prompt("valid_number")
  end
end

total_monthly = monthly_payment(loan_amount, loan_apr, loan_duration_months)

puts("=> Your monthly mortgage payment is $#{total_monthly}.")