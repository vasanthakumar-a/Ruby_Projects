def permutations(array_given, array_iterator = 0, result_array)
  if array_iterator == array_given.size
    clone_array = array_given.clone
    result_array << clone_array
  end
  (array_iterator..array_given.size-1).each do |swap|
    array_given[array_iterator], array_given[swap] = array_given[swap], array_given[array_iterator]
    permutations(array_given, array_iterator + 1, result_array)
  end
end

result_array = []
permutations([1,1,2], result_array)
print "Permutation of [1,1,2] is : ",result_array.uniq,"\n"

result_array = []
permutations([1,2,3], result_array)
print "Permutation of [1,2,3] is : ",result_array.uniq,"\n"

