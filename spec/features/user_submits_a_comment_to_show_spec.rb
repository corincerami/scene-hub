require 'rails_helper'

feature "User submits a comment to a show" do
  it "sees the comment on the show page" do
    venue = FactoryGirl.create(:venue)
    show = FactoryGirl.create(:show)
    visit show_path(show)
    fill_in "Comment", with: "This show looks cool."
    click_on "Submit"
    expect(page).to have_content "This show looks cool."
  end
end
