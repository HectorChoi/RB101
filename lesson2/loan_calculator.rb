# Build a mortgage / car payment calculator that takes the following as input:
# the loan amount, the APR, and the loan duration
# and calculates the following as output:
# monthly interest rate, loan duration in months, and the monthly payment

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(key)
  message = MESSAGES[key]
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def get_positive_number
  loop do
    input = gets.chomp
    return input if (integer?(input) || float?(input)) && input.to_f > 0
    prompt('error_positive')
  end
end

prompt('welcome')

loop do
  prompt('loan_amount')
  loan_amount = get_positive_number.to_f
  prompt('annual_percentage_rate')
  apr = get_positive_number.to_f
  prompt('loan_duration_years')
  loan_duration_years = get_positive_number.to_f # allow for partial years?

  mpr = apr / 1200
  loan_duration_months = loan_duration_years * 12
  monthly_payment = loan_amount *
                    (mpr / (1 - (1 + mpr)**(-loan_duration_months)))

  puts "=> The monthly interest rate is #{format('%.2f', mpr * 100)}%."
  puts "=> The loan duration in months is #{loan_duration_months.to_i}."
  puts "=> The monthly payment due is $#{format('%.2f', monthly_payment)}."

  prompt('again')
  answer = gets.chomp.downcase

  break unless answer == 'yes'
end

prompt('goodbye')
