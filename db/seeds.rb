# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Ledger.destroy_all
CreditCard.destroy_all

account = User.create(email: "google@gmail.com", password: "password")
ledger = Ledger.create(account_name: "Dave", user_id: account.id)
credit_card1 = CreditCard.create(credit_balance: 11800, apr_purchases: 0.2299, set_day_of_payment: "2021-08-20", ledger_id: ledger.id)
credit_card2 = CreditCard.create(credit_balance: 1979, apr_purchases: 0.1599, set_day_of_payment: "2021-08-10", ledger_id: ledger.id)

p "Created #{User.count} user account(s), #{Ledger.count} ledger account(s), and #{CreditCard.count} credit card(s)."