require 'rails_helper'

RSpec.describe ChargesController do
  describe "GET new" do
    it "assigns @amount" do
      get :new
      expect((@amount)).to eq(nil)
    end

    it "renders the index template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
