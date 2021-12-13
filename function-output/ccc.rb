# moji = "abcaaaaa"
# i = 0
# ender = 0
# loop do
#   p i
#   if moji.slice(i) == nil
#     p i
#     puts "終わり#{i}"
#     break
#   end
#   i += 1
# end

# moji = "heq!"
# if moji.size > 4
#   p moji.slice!(4,moji.size)
#   p moji + moji + moji
# else 
#   p moji + moji + moji
# end

# num = 20
# x = num / 10 % 10
# y = num / 1 % 10
# if num % 3 == 0
#   p "hoge"
#   p "a"
# elsif x % 3 == 0
#   p "hoge"
#   p "b"
# elsif y % 3 == 0 && y != 0
#   p "hoge"
#   p "c"
# else
#   p num
# end


moji = "aGgKgYxK"
moji2 = moji.downcase #小さい
moji3 = moji.upcase #大きい
baramoji = moji.split("")
baramoji2 = moji2.split("")
baramoji3 = moji3.split("")
kekkamoji = ""
num = 0
while num < moji.length
  if baramoji[num] != baramoji2[num]
    p kekkamoji += baramoji[num].downcase
  elsif baramoji[num] != baramoji3[num]
    p kekkamoji += baramoji3[num].upcase
  else
    p kekkamoji += baramoji[num]
  end

  num += 1
end

def switch_letter(origin_str)
  change_str = []
  strs = origin_str.split("")
  strs.each do |str|
    if str == str.upcase
       change_str << str.downcase
    else
       change_str << str.upcase
    end
  end
  change_str.join
end
puts switch_letter("abCD")