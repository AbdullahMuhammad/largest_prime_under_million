require 'prime'

prime_hash = {}
largest_prime = {}
target_number = 1000000

Prime.each(target_number) do |prime|
  prime_hash[prime] = true
end

sum_prime = prime_hash.keys.inject(0, :+)
reverse_primes = prime_hash.keys.reverse

reverse_primes.each_with_index do |prme, i|
  sum_prime = sum_prime - prme
  break if sum_prime <= target_number
end

count = prime_hash.count

prime_hash.keys.each_with_index do |key, i|
  sum = 0
  prime_hash.keys[i..count].each_with_index do |prme, k|
    sum += prme
    if prime_hash[sum] && prme != sum
      largest_prime[sum] = k + 1 if (largest_prime[sum].to_i <= k+1)
    end
    break if sum.to_i >= sum_prime.to_i
  end
end

ky = largest_prime.key(largest_prime.values.max)
puts "#{ky} , #{largest_prime[ky]}"