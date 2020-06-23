def merge(arr)
  return arr if arr.length === 1
  mid_index = arr.length/2
  left_arr = arr.take(mid_index)
  right_arr = arr.drop(mid_index)
  return merge_sort(merge(left_arr), merge(right_arr))
end

def merge_sort(left, right)
  arr = []
  while left.any? and right.any?
    if left[0] < right[0]
      arr.push(left.shift)
    else
      arr.push(right.shift)
    end
  end

  left.any? && arr.push(*left)
  right.any? && arr.push(*right)

  arr
end

p merge([849, 89, 57, 34, 109, 35, 17, 307])