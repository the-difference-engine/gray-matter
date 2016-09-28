class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def show
    @page_title = current_user.page_title
    @home_url = authenticated_root_path
  end
end
