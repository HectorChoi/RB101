# Refactoring after Code review by Jessica Chang
# Build a mortgage / car payment calculator that takes the following as input:
# the loan amount, the APR, and the loan duration
# and calculates the following as output:
# monthly interest rate, loan duration in months, and the monthly payment

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(key, custom_data='')
  message = format(MESSAGES[key], custom_data: custom_data)
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

def get_non_negative_number
  loop do
    input = gets.chomp
    return input if (integer?(input) || float?(input)) && input.to_f >= 0
    prompt('error_non_negative')
  end
end

def get_loan_amount
  prompt('loan_amount')
  get_positive_number.to_f
end

def get_apr
  prompt('annual_percentage_rate')
  get_non_negative_number.to_f
end

def get_loan_duration_years
  prompt('loan_duration_years')
  get_positive_number.to_f # allow for partial years?
end

def calculate_mpr(apr)
  apr / 1200
end

def calculate_loan_duration_months(loan_duration_years)
  loan_duration_years * 12
end

def calculate_monthly_payment(loan_amount, mpr, loan_duration_months)
  if mpr > 0
    format('%.2f', loan_amount *
           (mpr / (1 - (1 + mpr)**(-loan_duration_months))))
  else
    format('%.2f', (loan_amount / loan_duration_months))
  end
end

def display_summary(mpr, loan_duration_months, monthly_payment)
  prompt('monthly_interest_rate', format('%.2f', mpr * 100).to_s + '%')
  prompt('loan_duration_months', loan_duration_months.to_i)
  prompt('monthly_payment', "$" + monthly_payment.to_s)
end

def calculate_again?
  answer = nil
  loop do
    prompt('again')
    answer = gets.chomp.downcase
    break if %w(yes y no n).include?(answer)
    prompt('again_error')
  end
  %w(yes y).include?(answer)
end

loop do
  system 'clear'
  prompt('welcome')
  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration_years = get_loan_duration_years

  mpr = calculate_mpr(apr)
  loan_duration_months = calculate_loan_duration_months(loan_duration_years)
  monthly_payment = calculate_monthly_payment(loan_amount, mpr,
                                              loan_duration_months)

  display_summary(mpr, loan_duration_months, monthly_payment)

  break unless calculate_again?
end

prompt('goodbye')
