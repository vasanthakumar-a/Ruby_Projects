# bracket = "([{}])"
bracket = "(){}[]"
# bracket = "((}"
# bracket = "[(])"
# bracket = "[({})](]"


open_brace = ['(','[','{']
close_brace = [')',']','}']

hash = {')'=>'(',']'=>'[','}'=>'{'}
temp_arr = []

bracket.each_char do |i|
  if open_brace.include?(i)
    temp_arr<<i
  end
  if close_brace.include?(i)
    temp_arr.delete(hash[i])
  end
end

# puts temp_arr

if temp_arr.empty?
  puts true
else
  puts false
end
