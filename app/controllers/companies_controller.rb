class CompaniesController < ApplicationController
  def index
  	@companies = Company.limit(10)
  end

  def show
  	@company = Company.find(params[:id])
  end
end
