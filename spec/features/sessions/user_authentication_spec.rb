require "rails_helper"

feature "User authentication" do
  scenario "successfully log in" do
    user = create(:user)
    login_as(user)

    expect(page).to have_text(
      I18n.t("users.show.welcome", user: user.full_name),
    )
    expect(page).to have_text(I18n.t("sessions.create.flash.notice"))
  end

  scenario "succesfully log out" do
    user = create(:user)
    login_as(user)

    click_on(I18n.t("sessions.links.sign_out"))

    expect(page).to have_text(I18n.t("sessions.new.title"))
    expect(page).to have_text(I18n.t("sessions.destroy.flash.notice"))
  end
end
