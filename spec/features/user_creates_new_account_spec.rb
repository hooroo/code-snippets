require "rails_helper"

feature "user creates an account" do
  scenario "successfully" do
    visit(new_user_path)

    fill_in("user_username", with: "user")
    fill_in("user_email", with: "user@example.com")
    fill_in("user_password", with: "password")
    fill_in("user_first_name", with: "Foo")
    fill_in("user_last_name", with: "Bar")
    click_on("Create User")

    expect(page).to have_text("Welcome, Foo")
  end
end
