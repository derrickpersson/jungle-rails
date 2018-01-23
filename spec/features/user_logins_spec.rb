require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = User.create!(first_name: 'Derrick', last_name: 'Persson', email: 'd@d.com', password: '123', password_confirmation: '123')
  end

  scenario "User logs in" do
    visit root_path

    click_on("Login")
    fill_in 'email', with: 'd@d.com'
    fill_in 'password', with: '123'
    click_button "Submit"

    expect(page).to have_content('Products')
    expect(page).to have_content('Logout')
  end

end
