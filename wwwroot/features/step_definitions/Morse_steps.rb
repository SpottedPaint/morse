require './Morse.rb'

When /^I have entered (.*) into translator$/ do |n| 
	@m = Morse.new()
	@r = @m.translate(n)
end

Then /^the morse returned should be "(.*?)" .$/ do |t|
	if @r != t 
		raise "'#{t}' doesn't match '#{@r}'"
	end
end


