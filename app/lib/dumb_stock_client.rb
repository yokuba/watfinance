module DumbStockClient
	include HTTParty
	def self.get_companies
		response = HTTParty.get("https://dumbstockapi.com/stock?countries=US")
		return response.body
	end
end