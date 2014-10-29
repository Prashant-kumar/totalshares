#lib =  File.expand_path("../../lib/", __FILE__)
#$LOAD_PATH << lib
require 'totalshares'



webpage = Totalshares::Webpage.new "http://www.thegeekstuff.com/2014/10/linux-kvm-create-guest-vm/"

webpage.gplus :v => true
webpage.twitter :v => true
webpage.facebook :v => true
webpage.pinterest :v => true
webpage.stumbledupon :v => true
webpage.linkedin :v => true
webpage.reddit :v => true
webpage.shares_selected(["facebook", "linkedin", "twitter", "gplus"], :v => true)
webpage.all :v => true

puts "G-plus #{webpage.gplus}"
puts "twitter #{webpage.twitter}"
puts "facebook #{webpage.facebook}"
puts "pinterest #{webpage.pinterest}"
puts "stumbleupon #{webpage.stumbledupon}"
puts "linkedin #{webpage.linkedin}"
puts "reddit #{webpage.reddit}"
puts webpage.shares_selected(["facebook", "linkedin", "twitter", "gplus"])
puts webpage.all




website = Totalshares::Website.new("www.thegeekstuff.com")

puts website.facebook :depth_limit => 1, :v => true
puts website.twitter :depth_limit => 1
puts website.gplus :depth_limit => 1
puts website.shares_selected(["facebook", "linkedin", "twitter", "gplus"], :depth_limit => 1, :v => true)
puts website.all :depth_limit => 1, :v => true
puts website.all