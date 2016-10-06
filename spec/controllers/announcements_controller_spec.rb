require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @announcement = create(:announcement)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "expect to create an announcement" do
      params = { announcement: {
                   title: 'this is a title',
                   body: 'this is the body of the announcement'}
               }
      post :create, params 
      announcement = Announcement.all
      expect(response).to redirect_to( admins_path )
      expect(announcement.length).to eq(2)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @announcement.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "expect announcement to update" do
      announcement_params = {
        title: 'new title',
        body: 'new body text'
      }

      patch :update, id: @announcement.id, announcement: announcement_params
      announcement = Announcement.last
      expect(response).to redirect_to( admins_path )
      expect(announcement.title).to eq( 'new title' )
      expect(announcement.body).to eq( 'new body text' )
    end
  end

  describe "GET #destroy" do
    it "deletes an announcement" do
      expect(Announcement.all.size).to eq(1)
      get :destroy, id: @announcement.id
      expect(response).to redirect_to( admins_path )
      expect(Announcement.all.size).to eq(0)
    end
  end

end
