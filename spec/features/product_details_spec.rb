require 'rails_helper'

RSpec.feature "Visitor navigates to the Product Details page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end
  end

  scenario "They see the details for the single product" do

    visit root_path

    first('article.product').find('img').click

    # sleep 2

    # save_screenshot

  end

end
