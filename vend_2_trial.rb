class VendingMachine
#   DRINK_NAME = cola
#   DRINK_PRICE = 120
#   COLA_STODK = 5

  #入れられるお金群
  MONEY = [10, 50, 100, 500, 1000].freeze

  attr_reader :profit_money
  

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @profit_money = 0
    # @colas = { name: "cola", price: 120, stock: 5}
    # @juice_variation = {
    #   cola: { name: "cola", price: 120, stock: 5 },
    #   redbull: { name: "redbull", price: 200, stock: 5 },
    #   water: { name: "water", price: 100, stock: 5 },
    # }
    @juices = Juices.new.juices
  end

  #ステップ２ 2番目格納されているジュースの情報を取得
  def check_juice_info(juices: @juices)
    juices.each_value do |name|
        p "#{name[:name]}が#{name[:price]}円で、在庫は#{name[:stock]}本です。"
    end
    # p "#{@juice_variation[0][:name]}が#{@juice_variation[0][:price]}円で、在庫は#{@juice_variation[0][:stock]}本です。"
  end

  #ステップ３の1番目 購入の可否を出力する
  def possible_buy(simbol_juice_name)
    shortcut_juice_statement(simbol_juice_name)
    if  @juice_price <= @slot_money && @stock != 0
      p "買える"
    else
      p "買えない"
    end
  end

  #ステップ３の２、３番目 実行され購入が起きると、在庫を減らし売上を保存
  def buy_juice(simbol_juice_name, juices: @juices )
    shortcut_juice_statement(simbol_juice_name)
    if @juice_price <= @slot_money && @stock != 0
      juices[simbol_juice_name][:stock] -= 1 ##!!!
      @profit_money += @juice_price
      @slot_money -= @juice_price
    else
      
    end
  end

  #ステップ４の２ 投入金額と在庫から購入可能なドリンクのリストを出力する
  def display_possible_buy_juices(juices: @juices)
    juices.each_value do |juice|
      if juice[:price] <= @slot_money && juice[:stock] != 0
        p juice
      #   p "#{juice[:name]}が買えます。#{juice[:price]}円で残りは#{juice[:stock]}本です。"
      else

      end
    end
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return "#{money}" unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  #メソッドに使われるメソッドたち（部品）
  #飲み物の名前を引数に入れたら、それの値段と在庫を出力するメソッド
  def shortcut_juice_statement(simbol_juice_name, juices: @juices)
    info_the_juice = juices[simbol_juice_name] 
    @juice_price = info_the_juice[:price]
    @stock = info_the_juice[:stock]
  end  
end

class Juices
  attr_reader :juices

  def initialize
    @juices = {
      cola: { name: "cola", price: 120, stock: 5 },
      redbull: { name: "redbull", price: 200, stock: 5 },
      water: { name: "water", price: 100, stock: 5 },
    }
  end
end

#require '/Users/hajirokenji/workspace/ruby/studyruby/vend_2_trial.rb'