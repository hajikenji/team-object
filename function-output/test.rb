def weather
  puts "晴れ・曇り・雨"
end
weather
def introduce(name,year)
  puts  "私の名前は#{name}です。#{year}歳です。"
end
introduce("わい","24")

def add(n,y)
  sum = n + y
  if sum < 50
    return "50より小さい"
      
  end
  "50以上です"
end
puts add(30,40)

class House
end
5.times do
  p House.new
end 

name = "山田太郎"
age = "18"
puts "私の名前は#{name}です。年齢は#{age}歳です。"

# season = []
season = ["春","夏","”秋”"]
season.push("冬")
# p season[2]
house = house = [{price:"2000万",location: "東京都",size:"80坪"},{price:"1500万",location:"千葉県",size:"50坪"},{price:"800万",location:"埼玉県",size:"100坪"}]
puts house[1][:location]
puts house[0][:size]
puts house[2][:price]
puts house[2][:size]