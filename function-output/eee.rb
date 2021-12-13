def quick_sort(numbers)
    # 基準値を設定
    target = numbers.shift # shift:配列の先頭を取得するメソッド
    # 基準値より大きい要素、小さい要素を格納する配列を用意
    smallers = []
    biggers = []
    numbers.each do |number|
        if number < target
            smallers << number # <<演算子:左辺の配列の末尾に右辺の要素を加える
        else
            biggers << number
        end
    end
    return smallers + [target] + biggers # ソートした値を返却
end
numbers = [4, 6, 5, 2, 1, 3]
p quick_sort(numbers)
aaa = [1,2,3]
bbb = [4,5,6]
p aaa + bbb
aaa.each 