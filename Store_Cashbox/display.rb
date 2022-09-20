def display_intro
  puts "Welcome to Stores........"
end

def display_menu
  puts "1 : Add Product \n2 : View Product \n3 : Transaction \nq : Quit"
end

def display_billing_error
  puts "Billing error Insufficient balance in cash box\nEnter 1 to add amount to cashbox"
  get_cashbox_amount() if gets.to_i == 1
end

def display_balance_not_available(balance_to_give,denomination_given_to_user)
  puts "Cash Available in Cashbox to give is ",denomination_given_to_user
  puts "Cash Not Available in Cashbox : ",balance_to_give
end


def display_user_details
  puts "Users of ______ Store : \n"
  $users.each {
    |user_name,user_details|
    print user_name," : ",user_details
    puts
    puts
  }
end

def display_user_denomination
  puts "User Denomination : ",denomination_given_to_user
  puts
end

def display_balance_in_cashbox
  puts "Balance Available in Cash Box : "
  print $cash_box
  puts
  puts
end

def display_start_transaction
  puts "Welcome User #{user_iteration} ........."
  puts "Enter the Product Amount : "
end
