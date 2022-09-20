def transaction(user_iteration)
  display_start_transaction()
  product_amount = gets.to_i

  begin
    puts "Enter the Amount you given in list : "
    user_given_amounts = gets.chomp.split(",").map(&:to_i)
    given_amount = user_given_amounts.each(&:to_i).reduce(:+)
    raise unless (user_given_amounts.uniq - DENOMINATIONS).empty?
    raise if given_amount < product_amount
  rescue
    puts "Please enter the valid list of amount :( "
    retry
  end
  balance_to_give = given_amount - product_amount

  if $cashbox_total_amount<balance_to_give
    display_billing_error()
    return
  end

  if cashbox_blance_amount_check(balance_to_give) < balance_to_give
    display_billing_error()
    return
  end

  denomination_given_to_user = denominate_balance(balance_to_give)

  if denomination_given_to_user.empty?
    display_billing_error()
    return
  else
    add_amount_in_cashbox()
    adding_user_details()
  end
  display_user_denomination()
end

def adding_user_details
  $users["user#{user_iteration}"] = {
    "product_amount" => product_amount,
    "given_amount" => given_amount,
    "balance" => balance_to_give,
    "user_given_amounts" => user_given_amounts,
    "denomination_given_to_user" => denomination_given_to_user
  }
end
