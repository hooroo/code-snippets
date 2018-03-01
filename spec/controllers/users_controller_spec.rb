require "rails_helper"

describe UsersController do
  context "POST #create" do
    context "with invalid params" do
      it "does not create a new user" do
        user_params = { email: "bad@example.com" }

        expect do
          post :create, params: { user: user_params }
        end.not_to change(User, :count)
      end

      it "renders the :new template" do
        user_params = { email: "bad@example.com" }

        post :create, params: { user: user_params }

        expect(response).to render_template(:new)
      end

      it "displays a flash alert" do
        user_params = { email: "bad@example.com" }

        post :create, params: { user: user_params }

        expect(flash[:alert]).to match I18n.t("flash.users.create.alert")
      end
    end
  end
end
