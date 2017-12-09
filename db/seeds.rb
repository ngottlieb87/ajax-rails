Product.destroy_all
  #
  # def self.begin
  #   seed = Seed.new
  #   seed.generate_products
  # end

  # def generate_products
  #   20.times do |i|
  #     Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop)
  #   end
  # end


# Seed.begin


20.times do |index|
  Product.create!(name: Faker::Commerce.product_name,
                  price: rand(10...100),
                  description: Faker::Lorem.sentence(5, false,0).chop,
                  photo: URI.parse(Faker::LoremPixel.image))

end

p "Created #{Product.count} products"
