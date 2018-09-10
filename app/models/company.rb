class Company < ApplicationRecord
	include DumbStockClient

	belongs_to :value

	def self.create_companies
		companies = DumbStockClient.get_companies.split("}")
		companies.each do |company|
			companies_info = company.gsub('"','').gsub('{','').split(",").reject { |empty_string| empty_string.empty? || empty_string == "[" || empty_string == "]" }
			cleaned_companies = companies_info.each{|datum| datum.gsub("[","")}
			company_array = cleaned_companies.map{ |company_datum| company_datum.gsub("[","").split(":") }
			company_hashes = company_array.map{ |pair| Hash[*pair] if pair.count > 1 }.compact
			if !company_hashes.nil? && !(company_hashes == [])
				company_data = Company.new()
				company_data.symbol = company_hashes[0]["ticker"] 
				company_data.name = company_hashes[1]["name"]
				company_data.exchange = company_hashes[3]["exchange"]

				company_data.save
			end
		end
	end
end
