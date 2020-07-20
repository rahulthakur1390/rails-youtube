require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  login_user

  let(:user) { create(:user) }
  let(:movie) { create(:movie, user_id: user.id ) }
  describe "POST #create" do
    it "create like" do
      expect{
        post :create, xhr: true, params: { movie_id: movie.id }  
      }.to change(Like, :count).by 1 
    end
  end

  describe "Delete #destroy" do
    let(:movie_2) { create(:movie, user_id: subject.current_user.id ) }
    let!(:like) { create(:like, user_id: subject.current_user.id, movie_id: movie.id) }
    let!(:another_like) { create(:like, user_id: user.id, movie_id: movie_2.id) }

    it "destroy like" do
      expect{
        delete :destroy, xhr: true, params: { id: like.id, movie_id: movie.id }  
      }.to change(Like, :count).by(-1) 
    end
  end
end
