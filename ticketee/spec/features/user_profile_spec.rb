require 'rails_helper'

feature "Profile page" do
  scenario "viewing" do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    # print page.html

    expect(page).to have_button("Update Profile")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end

require 'rails_helper'

feature "Editing Users" do
  scenario "Updating a project" do
    user = FactoryGirl.create(:user)

    visit user_path(user)
    click_link 'Edit Profile'

    fill_in 'Username', with: 'new_username'
    click_button 'Update Profile'

    expect(page).to have_content("Profile has been updated.")
  end
end
