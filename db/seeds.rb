# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


5.times do 
    
    PurchaseOrder.create(
        [
            {
                po_number:  Faker::Invoice.reference,
                delivery_date: Faker::Date.between(from: '2022-05-31', to: '2022-07-25'),
                date: Faker::Date.between(from: '2022-04-29', to: '2022-05-31'),
                payment_terms: Faker::Lorem.sentence,
                amount: Faker::Commerce.price,
                cgst: 26,
                sgst: 26,
                igst: 26,
                tds: 66,
                description: Faker::Lorem.sentence
            }
        ]
    )

end

# PurchaseOrder.create(
#     [
#         {
#             po_number:  'A2789',
#             delivery_date: Date.new(2022,5,31),
#             date: Date.new(2022,5,25),
#             payment_terms: 'Pay without delay',
#             amount: 5682,
#             cgst: 26,
#             sgst: 26,
#             igst: 26,
#             tds: 66,
#             description: 'A good product'
#         }
#     ]
# )
