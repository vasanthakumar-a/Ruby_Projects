def denominate_balance(balance_to_give)
  denomination_given_to_user = {}
  DENOMINATIONS.map do
    |denomination_element|
    notes = balance_to_give / denomination_element.to_i
    if notes.nonzero?
      if $cash_box[denomination_element] > 0
        balance_to_give %=  denomination_element.to_i

        if $cash_box[denomination_element]>=notes
          $cash_box[denomination_element] -= notes
        else
          until $cash_box[denomination_element]==0
            $cash_box[denomination_element] -= 1
            notes-=1
          end
          balance_to_give = notes * denomination_element.to_i
        end

        denomination_given_to_user[denomination_element] = notes

        if cashbox_blance_amount_check(balance_to_give) < balance_to_give
          display_balance_not_available(balance_to_give,denomination_given_to_user)
          return {}
        end
      end
    end
  end
  return denomination_given_to_user
end
