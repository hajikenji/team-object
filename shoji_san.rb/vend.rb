# frozen_string_literal: true

#根本目的:これで議論が深まれば面白いかなと思ったからです。この変更はヤバイよ！と言って頂けると双方の理解が
##深まるのでよかったらお願いします。ただ個人が勝手にやっただけなのでスルーしてもらっても大丈夫です。

#変更目的:buyメソッドをスッキリさせたかった、またshow_buyableなどは依存が深いように感じたため
#変更点:show_buyableをVendに移動。金勘定もするメソッドだしVendにあっても違和感ない説
#変更点:select_1_from_list関連。依存を浅くして可読性を上げることが目的。そんなに変わってないかも
#変えててこれを書いた庄司さんはすごいなと思いました（ただの感想です）

# manage coins and sales
class VendingMachine
  attr_accessor :slot_money, :sales

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sales = 0
  end

  def insert_money(money)
    return "reject #{money} yen" unless MONEY.include?(money)

    @slot_money += money
  end

  def return_money
    p "return #{@slot_money}"
    @slot_money = 0
  end

  def buy(juices)
    if select_1_from_list(juices)
      juice_info = juices.list[@juice]
      juice_info.stock -= 1
      # juice_info.price２回でない方がいいのでは？
      @sales += juice_info.price
      @slot_money -= juice_info.price
      p "got #{@juice}!!"
      p "#{@slot_money} yen remain in the vending machine"
    else
      p "You can't buy it. Please select from the list"
    end
  end
  
  #追加メソッド
  #可読性その他に影響しないなら、
  #buyメソッドのif判定文に select_juice( show_buyable_list(juices) )
  #って書きたい（スッキリするから）
  def select_1_from_list(juices)
    a = show_buyable_list(juices)
    select_juice(a)
  end

  # ask to input juice name and make it symbol
  def select_juice(buyable_list)
    p 'You can buy from the list below'
    p buyable_list
    p 'please select what you want in the list'
    juice = gets.chomp
    @juice = juice.to_sym if buyable_list.include?(juice)
  end

  #ListからVendingに移動
  def show_buyable_list(juices)
    a = juices.list.select do |_key, value|
      value.price <= slot_money && value.stock.positive?
    end
    a.keys.map(&:to_s)
  end

  #買えるかどうか見るだけ用
  def get_buyable_list(juices)
    juices.list.select do |_key, value|
      value.price <= vending.slot_money && value.stock.positive?
    end
  end

end

# juice info
class Juice
  attr_reader :name, :price
  attr_accessor :stock

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end

# control juices list
class List
  attr_reader :list

  def initialize
    @list = {}
  end

  def initialize_stock
    @list = {}
    @list[:monster] = Juice.new('monster', 210, 5)
    @list[:gogotea] = Juice.new('gogotea', 120, 6)
    @list[:protein] = Juice.new('protein', 350, 10)
  end

  def add_stock(name:, price:, stock:)
    name_sym = name.to_sym
    if @list.keys.include?(name_sym)
      @list[name_sym].stock += stock
    else
      @list[name_sym] = Juice.new(name, price, stock)
    end
  end

  def delete_stock(name:)
    @list.delete(name.to_sym)
  end

  def keys
    @list.keys
  end

  # show juice and its stock
  # [{:monster=>5}, {:gogotea=>6}, {:protein=>10}, {:greentea=>8}]
  def stocks
    @list.map do |key, value|
      { key => value.stock }
    end
  end

  # get hash like below
  # {:monster=>#<Juice:0x00007fc29b03fc40 @name="monster", @price=210, @stock=5>,
  # :gogotea=>#<Juice:0x00007fc29b03fa10 @name="gogotea", @price=120, @stock=6>,
  # :protein=>#<Juice:0x00007fc29b03f9c0 @name="protein", @price=350, @stock=10>}

  # def get_buyable_list(vending)
  #   @list.select do |_key, value|
  #     value.price <= vending.slot_money && value.stock.positive?
  #   end
  # end

  # get array
  # ["monster", "gogotea", "protein"]

  # def show_buyable_list(vending)
  #   get_buyable_list(vending).keys.map(&:to_s)
  # end
end