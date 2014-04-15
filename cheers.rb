name = gets.chomp.downcase

if name.length > 0 && name.to_i == 0
  puts "#{name.upcase}'s just GRAND!"
  name.each_char do |char| char.gsub(/[aeiouy]/, "").length == 0 ? word = "an" : word = "a"
    puts "Give me #{word}.. #{char.upcase}"
  end
else
  puts "Nothing passed!"
end
