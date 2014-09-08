#Dir.glob(Rails.root.join("db", "seeds", "*.rb"))

puts "Seeding..."
seeds= {
  'user.rb'=> 1
}

seeds.each do |file,flag|
  if flag==1
    print "-> #{file} ... "
    load "db/seeds/#{file}" 
    puts "ok"
  end
end

puts "Done"
