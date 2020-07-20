require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  login_user

  describe "GET #index" do
    let(:movie_1) { create(:movie, user_id: subject.current_user.id ) }
    let(:movie_2) do
      create(
        :movie,
        title: "second movie",
        description: "send movie des",
        url: "https://www.youtube.com/watch?v=9cfyLNH2SGk",
        user_id: subject.current_user.id
      )
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "has return movies" do
      get :index
      expect(assigns(:movies)).to match_array([movie_1, movie_2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    let(:url) { "https://www.youtube.com/watch?v=9cfyLNH2SGk" }
    it "creates movie" do
      expect{
        post :create, params: { movie: { url: url } }  
      }.to change(Movie, :count).by 1 
    end
  end
end
