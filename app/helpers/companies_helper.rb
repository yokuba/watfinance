module CompaniesHelper
	def add_new_company_partial_path
    if user_signed_in?
      'companies/category/add_new_company/signed_in'
    else
      'companies/category/add_new_company/not_signed_in'
    end
  end

  def all_values_button_partial_path
    if params[:value].blank?
      'companies/category/values/all_selected'
    else
      'companies/category/values/all_not_selected'
    end
  end

  def no_companies_partial_path
  	@companies.empty? ? 'companies/category/no_companies' : 'shared/empty_partial'
	end
end
