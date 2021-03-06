module Features
  module AuthenticationHelpers

    def login_as(user)
      visit login_path
      within "form" do
        fill_in("session_email", with: user.email)
        fill_in("session_password", with: user.password)
        click_on(I18n.t("sessions.new.submit"))
      end
    end
  end
end

RSpec.configure do |config|
  config.include Features::AuthenticationHelpers, type: :feature
end
