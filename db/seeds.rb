# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include IexClient

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
  # companies = Company.all.map{|c|c}
  # companies = companies.delete_if{ |company| company.symbol.include?('.') }
  # titles = []
  # companies.each do |company|
  #   company.symbol = company.symbol.gsub('^', '').gsub(/\s+/, "")
  #   begin   
  #     p company.symbol
  #     company.logo_img_url = (IexClient.get_company_logo(company.symbol)).url
  #   rescue IEX::Errors::SymbolNotFoundError => e
  #     puts "#{e.message}"
  #     next
  #   end
  #   company.category = (IexClient.get_company_data(company.symbol)).industry
  #   company.description = (IexClient.get_company_data(company.symbol)).description
  #   symbol = (company.symbol.split('^')[0] if company.symbol.include?('^')) && (company.symbol.split('.')[0] if company.symbol.include?('.'))

  #   company.save
    # titles << ['green', 'employee-centric', 'humane', 'outreach', 'fair_trade', 'education', 'waste management', 'health', 'economic growth', 'innovation', 'peace', 'water', 'sustainability']
  companies = Company.all
  # companies.each do |company|
  #   value = Value.new(
  #     title: company.category,
  #     description: company.description
  #   )

  values = Value.all
  values.each do |value|
    companies.each do |company|
      value.companies << company if value.title == company.category
    end
    value.save
  end
end

# seed_users
# seed_companies
seed_values