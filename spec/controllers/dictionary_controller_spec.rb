require 'rails_helper'

describe DictionaryController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    context "with invalid params" do
      it "returns not found" do
        expect(Search).to receive(:definitions)
        get :index, word: "123456"
        expect(response).to have_http_status(:missing)
        expect(assigns(:definitions)).to be_nil
      end
    end

    context "with valid params" do
      it "assigns definitions" do
        expect(Search).to receive(:definitions).and_return(["fruit"])
        get :index, word: "apple"
        expect(response).to have_http_status(:success)
        expect(assigns(:definitions)).to match(["fruit"])
      end
    end
  end
end
