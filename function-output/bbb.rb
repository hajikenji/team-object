a = 10
b = 0
c = 2
winArray = []
# def bigbig(q,w)
#   if q >= w
#     winArray.push(q)
#     return winArray
#   else w >= q
#     winArray.push(w)
#     return winArray
#   end
# end
# p bigbig(a,b)
# p bigbig(a,c)
# p bigbig(b,c)

def bigbig(q,w,winArray)
  if q >= w
    winArray << q
    return winArray
  else w >= q
    winArray << w
    p winArray
  end
end
winArray = []
bigbig(a,b,winArray)
bigbig(a,c,winArray)
bigbig(b,c,winArray)
p winArray

if winArray[0] == winArray[1]
  p winArray[2]
  p "a"
elsif winArray[1] == winArray[2]
  p winArray[0]
  p "b"
else
  p winArray[1]
  p "c"
end