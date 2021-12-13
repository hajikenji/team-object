num = 46
if num >= 50
  puts "50以上だよ"
elsif num == 30
  p "30ジャストだよ"
else
  p "50未満だよ"
end

if num % 2 == 0
  puts "numは偶数"
else
  puts "numは奇数"
end

i = 0
# while i<10
#   p "おはよう"
#   i += 1
# end
# for value in 0..9 do
#   p "こんにちは"
# end
# 10.times {p "こんばんは"}
# array = [1,2,3,4,5,6,7,8,9,10]
# array.each do |single|
#   p single
# end
# def addition(x,y,z)
#   return x / y
# end
# p addition(10,5,7)
def doing(date, place, food)
  return "#{date}は#{place}で#{food}を食べる"
end
puts doing("今日","渋谷","カレー")
# puts doing
