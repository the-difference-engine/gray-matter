require 'rails_helper'
include SignIn

RSpec.describe ResourcesController, type: :controller do
  before(:each) do
    sign_in_user
    #below got put into a support file
    # request.env["devise.mapping"] = Devise.mappings[:user]
    # sign_in FactoryGirl.create(:user)
    @resource = create(:resource)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "expect to create an resource" do
      params = { resource: {
                  title: 'this is a title',
                  link: 'http://www.google.com',
                  description: 'this is the description for the resource'
                 }
               }
      post :create, params 
      resource = Resource.all
      expect(response).to redirect_to( admins_path )
      expect(resource.length).to eq(2)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @resource.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "expect resource to update" do
      resource_params = {
        title: 'this is a title',
        link: 'http://www.google.com',
        description: 'this is the description for the resource'
      }

      patch :update, id: @resource.id, resource: resource_params
      resource = Resource.last
      expect(response).to redirect_to( admins_path )
      expect(resource.title).to eq( 'this is a title' )
      expect(resource.link).to eq( 'http://www.google.com' )
      expect(resource.description).to eq( 'this is the description for the resource' )
    end
  end

  describe "GET #destroy" do
    it "deletes an announcement" do
      expect(Resource.all.size).to eq(1)
      get :destroy, id: @resource.id
      expect(response).to redirect_to( admins_path )
      expect(Resource.all.size).to eq(0)
    end
  end

end
