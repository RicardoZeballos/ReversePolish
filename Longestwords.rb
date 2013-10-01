# #!/usr/bin/env ruby

require 'set'

def built?(str, partof)
  size = str.length
	if (partof && @wordset.member?(str))
		return true
	else
  	for i in 1..size-1
			if (@wordset.member?(str.slice(0,i)) && built?(str.slice(i,size-i),true)) 
   			return true
			end
		end
		return false
	end
end

filename = ARGV[0]
longestword = nil
longestwordsize = 0
wordcount = 0

print "Reading file: #{filename}\n"
wordarray = File.readlines(filename).each {|l| l.chomp!}

@wordset = wordarray.to_set
wordarray.each do |word|
  if built?(word,false)	
		wordcount += 1
    if word.length > longestwordsize
			longestword = word
			longestwordsize = word.length
		end
  end
end

print "Longest Word: #{longestword}\n"
print "Words Built from others: #{wordcount}\n"
