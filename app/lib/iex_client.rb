module IexClient
	def self.get_news
		return IEX::Resources::News.get(:market)
	end

	def self.get_company_data(symbol)
		return IEX::Resources::Company.get(symbol)
	end

	def self.get_company_news(symbol)
		return IEX::Resources::News.get(symbol)
	end

	def self.get_company_logo(symbol)
		return IEX::Resources::Logo.get(symbol)
	end
end