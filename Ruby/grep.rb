#!/usr/bin/env ruby

IO.foreach("waste_land.txt") do |block|
  puts block if block =~ / have/
end
