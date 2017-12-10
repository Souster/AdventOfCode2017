# arr = [[0,0,0],[0,1,0],[0,0,0]]
# puts "#{arr}"
# arr.unshift(["a","b"])
# arr.push(["y","z"])
# arr[1].unshift("b")

def run
  i = 1
  j = 1
  maxi = 2
  maxj = 2
  go = 0
  print_result(i,j)

  while i <= maxi and j <= maxj
    if (i < maxi and i > 0) and (j < maxj and j > 0)
      j += 1
    elsif (i > 0 and i < maxi) and  j == maxj
      i -= 1
    elsif i == 0 and j == maxj
      j -= 1 
    elsif i == 0 and (j < maxj and j > 0)
      j -= 1
    elsif i == 0 and j == 0
      i += 1
    elsif i < maxi and j == 0
      i += 1
    elsif i == maxi and j < maxj
      j += 1
    else
      go += 1
      if go <= 2
        maxi += 1
        maxj += 1
      else
        go = 3
        break
      end
    end
  print_result(i,j)
  end
end

def print_result(i,j)
  puts "I: #{i}, J: #{j}"
end

run
