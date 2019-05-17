# CLEAR DATABASE

Ingredient.delete_all
Cocktail.delete_all

# CREATE FAKE INGREDIENTS

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = RestClient.get(url)
data = JSON.parse(response)

puts "Creating fake ingredients..."

data["drinks"].each_with_index do |item, index|
 puts "Creating fake ingredient #{index + 1}..."
 Ingredient.create(name: item["strIngredient1"])
end

puts "Finished creating fake ingredients..."

# CREATE FAKE COCKTAILS

puts 'Creating fake cocktails...'
10.times do |tally|
 puts "Creating fake cocktail #{tally + 1} of 10"
 Cocktail.create(name: Faker::FunnyName.two_word_name)
end
puts 'Finished creating fake cocktails!'
