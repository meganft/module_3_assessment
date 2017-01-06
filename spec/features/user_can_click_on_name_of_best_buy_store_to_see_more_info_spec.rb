require 'rails_helper'

describe "As a user, after I have entered the zip code to search" do
  scenario "I can click on one store and see more information about that store" do
    VCR.use_cassette('best_buy_service#by_location') do

      visit root_path
      within(:css, ".zipsearch") do
        fill_in "zip", with: '80202'
        click_on "Locate"
      end

      within('ol') do
        click_on "Best Buy - Belmar"
      end

      expect(current_path).to eq("/stores/1224")
      expect(page).to have_content("Mon: 10-9")
    end
  end
end


# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
