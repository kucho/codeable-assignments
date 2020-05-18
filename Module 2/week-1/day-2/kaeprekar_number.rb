def kaprekar?(k)
  k_len = k.to_s.size
  pow_num = (k ** 2).to_s
  right = pow_num.slice!(-k_len, k_len).to_i
  left = pow_num.to_i
  left + right == k
end

print kaprekar?(9)