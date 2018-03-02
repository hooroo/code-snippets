require "rails_helper"

feature "user authentication" do
  scenario "successfully log in" do
    user = create(:user)

    visit(login_path)
    fill_in("session_email", with: user.email)
    fill_in("session_password", with: user.password)
    click_on(I18n.t("sessions.new.submit"))

    expect(page).to have_text(
      "#{I18n.t('users.show.welcome')}, #{user.first_name}",
    )
    expect(page).to have_text(I18n.t("sessions.create.flash.notice"))
  end
end
