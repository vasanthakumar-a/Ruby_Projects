require './container.rb'
require './display.rb'
require './check_menu.rb'
require './denomination.rb'
require './products.rb'
require './transactions.rb'
require './cashbox.rb'

def main
  display_intro()
  get_cashbox_amount()
  check_menu()
  display_user_details()
  display_balance_in_cashbox()
end

main()
