require 'rest-client'
require 'json' #JavaScript Object Notation
require 'pry'

puts "taking a quick nap. Be right back"

# sleep(5)

#
begin
 # some code??
 hotdog
rescue NameError
  puts 'saved u'
end
# hotdog
puts "okay I'm awake now"

puts "Making an HTTP GET request with RestClient"

ron_swanson_quote_response = RestClient.get('http://ron-swanson-quotes.herokuapp.com/v2/quotes')
# binding.pry
puts "Request is complete"

parsed_quote = JSON.parse(ron_swanson_quote_response)

puts "Parsing the JSON from the response"

print parsed_quote
