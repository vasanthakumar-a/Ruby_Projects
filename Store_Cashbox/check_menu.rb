def check_menu
  _user_iteration = 0
  loop {
    _user_iteration += 1
    #-- -- -- --Choose Your Choice-- -- -- --
    display_menu()
    user_choice = gets.chomp
    case user_choice
    when '1'
    product_list = add_product()
    when '2'
    view_product(product_list)
    when '3'
    transaction(_user_iteration)
    when 'q'
    break
    end
    display_balance_in_cashbox()
  }
end
