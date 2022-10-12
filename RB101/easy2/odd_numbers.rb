def odd
  (1..99).to_a.each { |i| puts i if i.odd? }
end

def odd_alt
  1.upto(99).each { |i| puts i if i.odd? }
end

odd_alt