require "rails_helper"

describe SessionsController do
  context "POST #create" do
    context "with invalid credentials" do
      it "does not create a session" do
        user = build_stubbed(:user)

        post :create, params: { session: { email: user.email } }

        expect(session[:user_id]).to be_nil
      end

      it "renders the :new template" do
        user = build_stubbed(:user)

        post :create, params: { session: { email: user.email } }

        expect(response).to render_template(:new)
      end

      it "displays a flash alert" do
        user = build_stubbed(:user)

        post :create, params: { session: { email: user.email } }

        expect(flash[:alert]).to match I18n.t("sessions.create.flash.alert")
      end
    end
  end

  context "GET #new" do
    context "when a user is already logged in" do
      it "renders the user :show template" do
        user = build_stubbed(:user)
        allow(controller).to receive(:current_user).and_return(user)

        get :new

        expect(response).to redirect_to(user_path(user))
      end

      it "displays a flash alert" do
        user = build_stubbed(:user)
        allow(controller).to receive(:current_user).and_return(user)

        get :new

        expect(flash[:alert]).to match I18n.t("sessions.new.flash.alert")
      end
    end
  end
end
