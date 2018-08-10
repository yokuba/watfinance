class CompaniesController < ApplicationController
  def index
  	@companies = Company.limit(10)
  end
end
