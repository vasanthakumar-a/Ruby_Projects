def transaction(user_iteration)
  puts "Welcome User #{user_iteration} ........."
  puts "Enter the Product Amount : "
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

  #-- -- -- -- --Add Amount in Cash Box-- -- --

  if $cashbox_total_amount<balance_to_give
    billing_error()
    return
  end

  if cashbox_blance_amount_check(balance_to_give) < balance_to_give
    billing_error()
    return
  end

  #-- -- -- -- - Denomination-- -- -- -- --

  denomination_given_to_user = denominate_balance(balance_to_give)

  if denomination_given_to_user.empty?
    billing_error()
    return
  else
    user_given_amounts.each {
      | each_amount |
        $cash_box[each_amount] += 1
    }
    $users["user#{user_iteration}"] = {
        "product_amount" => product_amount,
        "given_amount" => given_amount,
        "balance" => balance_to_give,
        "user_given_amounts" => user_given_amounts
    }

    $users["user#{user_iteration}"].store("denomination_given_to_user", denomination_given_to_user)
  end

  puts "User Denomination : ",denomination_given_to_user
  puts
end
