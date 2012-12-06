require './Morse.rb'

When /^string starts with '(\.)' or '(\-)'$/ do |dot,dash|
	@m = Morse.new()
	@dot = @m.english?(dot)
	@dash = @m.english?(dash)
end

Then /^its Morse$/ do
	if @dash or @dot
		raise "'#{@dash}' isn't false"
	end
end

When /^string does not start with '(\.)' or '(\-)'$/ do |dot,dash|
	@m = Morse.new()
	@dot = @m.english?('e')
	@dash = @m.english?('f')
end

Then /^its English$/ do
	if !@dash or !@dot
		raise "'#{@dot}' && '#{@dash}' isn't true"
	end
end