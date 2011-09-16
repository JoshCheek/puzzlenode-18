%w[on off and or xor not light].each do |type|
  require "circuit_logic/types/#{type}"
end
