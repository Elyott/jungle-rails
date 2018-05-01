require 'rails_helper'

RSpec.feature "A User can login", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: 'First User',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

    scenario "They can log in" do
      visit '/login'

      within 'form' do
        fill_in id: 'email', with: 'first@user.com'
        fill_in id: 'password', with: '123456'

        click_button 'Submit'
      end

    expect(page).to have_content 'Signed in as First User'

    end
end
