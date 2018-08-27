# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
  user_id = 0
  10.times do 
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id = user_id + 1
  end
end

def seed_companies
  companies = %w(wm nue trex)

  for company_symbol in companies do 
    company = IEX::Resources::Company.get(company_symbol)
    Company.create(
      name: company.company_name,
      description: company.description,
      category: company.industry
    )
  end
end

def seed_values
  companies = Company.all
  titles = ['green', 'employee-centric', 'humane', 'outreach', 'fair_trade', 'education', 'waste management', 'health', 'economic growth', 'innovation', 'peace', 'water', 'sustainability']
  companies.each do |company|
    Value.create(
      title: 'green',
      description: 'Optimal methods for reducing waste', 
      user_id: rand(1..11),
      company_id: company.id
    )
  end
end

seed_users
seed_companies
seed_values