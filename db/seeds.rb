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
  Company.create(category: 'fintech', name: 'Fine Ants', description: 'Fixing the bugs in investing, Fine Ants makes your money work for you.')
  Company.create(category: 'healthcare', name: 'hackcare', description: 'Hack your way healthy.')
  Company.create(category: 'transportation', name: 'GTFo', description: 'Going to Travel Forever (GTFo) is a different kind of company, one that invests in its employees.')
end

def seed_values
  companies = Company.all
  titles = ['green', 'employee-centric', 'humane', 'outreach']
  companies.each do |company|
    5.times do
      Value.create(
        title: titles[rand(0..3)],
        description: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        company_id: company.id
      )
    end
  end
end

seed_users
seed_companies
seed_values