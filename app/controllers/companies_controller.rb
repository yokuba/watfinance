class CompaniesController < ApplicationController
	include IexClient
	include DumbStockClient
  def index
  	@news = IexClient.get_news[0]
  	#TODO move this into a job
  	# Company.create_companies
  	@companies = Company.limit(100)
  end

  def show
  	@company = Company.find(params[:id])
  	@logo = IexClient.get_company_logo(@company.symbol)
  	@news = IexClient.get_company_news(@company.symbol)
  	@data = IexClient.get_company_data(@company.symbol)
  end

  def humane
    companies_for_category(params[:action])
  end

  def green
    companies_for_category(params[:action])
  end

  def fair_trade
    companies_for_category(params[:action])
  end

  private

	def companies_for_category(category)
	  @value = Value.find_by(title: category)
	  @companies = get_companies.paginate(page: params[:page])
	end

	def get_companies
  	Company.limit(10)
	end
end
