require './Morse.rb'

When /^I enter Morse (.*) into translator$/ do |n| 
	@m = Morse.new()
	@r = @m.translate(n)
end

Then /^the English returned should be "(.*?)" .$/ do |t|
	if @r != t 
		raise "'#{t}' doesn't match this '#{@r}'"
	end
end