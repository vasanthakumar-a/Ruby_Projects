def get_cashbox_amount
  for _ in DENOMINATIONS
    puts "Enter the Amount of #{_} rs : "
    get_amount = gets.to_i
    $cash_box[_] += get_amount
  end
  cashbox_total_amount_check()
end

def cashbox_total_amount_check
$cashbox_total_amount = $cash_box.map {
    |cash_box_key, cash_box_value|
    cash_box_key.to_i * cash_box_value
}.reduce(:+)
end

def cashbox_blance_amount_check(balance_to_give)
  balance_amount_in_cashbox = 0
   $cash_box.map {
    |cash_box_key, cash_box_value|
    if balance_to_give >= cash_box_key.to_i
      balance_amount_in_cashbox += cash_box_key.to_i * cash_box_value
    end
  }
  return balance_amount_in_cashbox
end

def add_amount_in_cashbox(user_given_amounts)
  user_given_amounts.each {
    | each_amount |
      $cash_box[each_amount] += 1
  }
end
