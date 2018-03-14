require "rails_helper"

feature "User updates account" do
  scenario "successfully" do
    user = create(:user)

    visit(login_path)
    fill_in("session_email", with: user.email)
    fill_in("session_password", with: user.password)
    click_on(I18n.t("sessions.new.submit"))

    visit(edit_user_path(user))
    fill_in("user_first_name", with: "Qwerty")
    fill_in("user_password", with: user.password)
    click_on(I18n.t("users.edit.submit"))

    expect(page).to have_text("#{I18n.t('users.show.welcome')}, Qwerty")
    expect(page).to have_text(I18n.t("flash.users.update.notice"))
  end
end
