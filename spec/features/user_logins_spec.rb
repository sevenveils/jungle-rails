require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    user = User.create!(
        first_name: 'Sheriff',
        last_name: 'Truman',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      )

  end

  scenario "User logs in" do

    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'user@example.com'
      fill_in id: 'password', with: 'password'

      click_button 'Submit'

    end

    save_screenshot

    expect(page).to have_content 'Products'

  end
end