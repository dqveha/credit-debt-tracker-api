# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ledger1 = Ledger.create(name: "Dave")
credit_card1 = CreditCard.create(credit_limit: 11800, apr_purhases: 0.2299, set_day_of_payment: 0)