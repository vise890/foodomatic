require 'spec_helper'

describe BasketController do

  context 'for a user that is logged in' do

    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    describe "#show" do

      it "returns a list of the current_user's basket" do
        get :show
        expect(assigns(:basket)).to eq @user.basket
      end

      it "returns the correct template" do
        get :show
        expect(response).to render_template('show')
      end

    end

    describe "#add_to_basket" do

      context "with a valid recipe" do

        before do
          @recipe = FactoryGirl.create(:recipe)
          post :add_to_basket, { recipe: @recipe }
        end

        it "adds the right recipe to the basket" do
          expect(@user.basket).to include(@recipe)
        end

        it "redirects to the basket item count" do
          expect(response).to redirect_to basket_count_items_path
        end

      end


    end

    describe "#item_count" do

      it "returns the number of items in the current user's basket" do

      end

    end

  end
end
