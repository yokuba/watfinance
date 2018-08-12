require "rails_helper"

RSpec.feature "Visit single company", :type => :feature do
  let(:user) { create(:user) }
  let(:company) { create(:company) }

  scenario "User goes to a single company from the home page", js: true do
    company
    visit root_path
    page.find(".single-company-card").click
    expect(page).to have_selector('body .modal')
    page.find('.interested a').click
    expect(page).to have_selector('#single-company-content p', text: company.description)
  end
end
