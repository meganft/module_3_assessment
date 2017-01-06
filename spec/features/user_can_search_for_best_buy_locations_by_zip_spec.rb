require 'rails_helper'

describe "As a user, when I visit root path and enter a zip code into search bar" do
  scenario "I can see closest best buy locations" do

    visit root_path
    within(:css, ".zipsearch") do
      fill_in "zip", :with => '80202'
    end

    # expect(current_path).to eq('/search')
    expect(page).to have_content("16 Total Stores")
    # expect(page).to have_content("15")
    expect(page).to have_content("Best Buy - Belmar")
    expect(page).to have_content("Lakewood")
    expect(page).to have_content("Lakewood")
    expect(page).to have_content("5.28")
    expect(page).to have_content("303-742-8039")
    expect(page).to have_content("BigBox")
  end
end

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results
