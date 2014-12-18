require 'rails_helper'

feature "User submits a new show" do
  # As a User
  # I want to post about a show
  # So fans can find out about it

  # Acceptance Criteria:

  # I must be signed in
  # I must enter a band name
  # I must enter at least one genre for the band
  # I must enter a date and time for the show
  # I must enter a venue name
  # I must enter a venue street address
  # I must enter a venue city
  # I must enter a venue state
  # I must enter a venue zip code

  it "creates a show when required fields are entered" do
    visit new_show_path
    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    fill_in "Band Name", with: "Screaming Females"
    check "punk"
    check "rock"
    fill_in "Venue Name", with: "Bell House"
    fill_in "Street Address 1", with: "66 Kenzel Ave"
    fill_in "City", with: "Nutley"
    fill_in "State", with: "NJ"
    fill_in "Zipcode", with: "07110"
    fill_in "Datetime", with: DateTime.new

    click_on "Submit show"

    expect(page).to have_content "Show created!"
    expect(page).to have_content "Screaming Females"
  end
end
