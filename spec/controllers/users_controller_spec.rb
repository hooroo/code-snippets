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

  context "PUT #update" do
    context "with invalid params" do
      it "does not update account details" do
        user = create(:user, first_name: "original")
        allow(controller).to receive(:current_user).and_return(user)

        put :update, params: { id: user.id, user: { first_name: "" } }

        expect(user.reload.first_name).to eq("original")
      end

      it "renders the :edit template" do
        user = create(:user, first_name: "original")
        allow(controller).to receive(:current_user).and_return(user)

        put :update, params: { id: user.id, user: { first_name: "" } }

        expect(response).to render_template(:edit)
      end

      it "displays a flash alert" do
        user = create(:user, first_name: "original")
        allow(controller).to receive(:current_user).and_return(user)

        put :update, params: { id: user.id, user: { first_name: "" } }

        expect(flash[:alert]).to match I18n.t("flash.users.update.alert")
      end
    end
  end
end
