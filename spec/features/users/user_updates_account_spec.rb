require "rails_helper"

feature "User updates account" do
  scenario "successfully" do
    user = create(:user)
    login_as(user)

    visit(edit_user_path)
    fill_in("user_first_name", with: "john")
    fill_in("user_last_name", with: "doe")
    fill_in("user_password", with: user.password)
    click_on(I18n.t("users.edit.submit"))

    expect(page).to have_text(I18n.t("flash.users.update.notice"))
    expect(page).to have_text(
      I18n.t("users.show.welcome", user: "John Doe"),
    )
  end
end
