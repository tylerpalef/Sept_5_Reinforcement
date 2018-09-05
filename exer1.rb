require 'httparty'

toronto_wards_response = HTTParty.get('https://represent.opennorth.ca/boundaries/toronto-wards/?limit=1000')

toronto_wards_json = JSON.parse(toronto_wards_response.body)

puts "List of Wards:"
toronto_wards_json["objects"].each do |ward|
  puts ward["name"]
end

toronto_candidates_response = HTTParty.get("https://represent.opennorth.ca/candidates/?limit=100&offset=20")
toronto_candidates_json = JSON.parse(toronto_candidates_response.body)

puts "List of Candidates"
puts " "
toronto_candidates_json["objects"].each do |trump|
  print trump["first_name"]
  print " "
  print trump["last_name"]
  puts " "
  puts trump["district_name"]
  puts " "
end
