class ProfileController < ApplicationController
  def index
    @posts = Post.all
  end
end
