require "rails_helper"

feature "User authentication" do
  scenario "successfully log in" do
    user = create(:user)

    visit(login_path)
    fill_in("session_email", with: user.email)
    fill_in("session_password", with: user.password)
    click_on(I18n.t("sessions.new.submit"))

    expect(page).to have_text(
      I18n.t("users.show.welcome", user: user),
    )
    expect(page).to have_text(I18n.t("sessions.create.flash.notice"))
  end

  scenario "succesfully log out" do
    user = create(:user)

    visit(login_path)
    fill_in("session_email", with: user.email)
    fill_in("session_password", with: user.password)
    click_on(I18n.t("sessions.new.submit"))

    click_on(I18n.t("sessions.links.sign_out"))

    expect(page).to have_text(I18n.t("sessions.new.title"))
    expect(page).to have_text(I18n.t("sessions.destroy.flash.notice"))
  end
end
