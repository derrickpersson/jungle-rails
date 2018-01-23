require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Clothing'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(2),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 69.99
      )
    end
  end

  scenario "They see the product details" do
    visit root_path
    click_on(class: 'btn btn-default', match: :first)
    sleep 1
    save_screenshot
    expect(page).to have_content("Reviews")
    expect(page).to have_css('.product-detail')
  end
end
