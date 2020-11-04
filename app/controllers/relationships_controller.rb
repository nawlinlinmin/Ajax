class RelationshipsController < ApplicationController
  # If you are using Devise logged_in?の代わりに下記を使用する。
  # before_action :authenticate_user!
  respond_to? :js # If you want to return all the existing action responds with js, you can do it with such a description.
  def create
    # If it is a login function that you created yourself, you should have implemented it yourself
    # logged_in?メソッドを使用して、ログイン時のみFollowできるようにする。
    if logged_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end
  end
  def destroy
  @user = Relationship.find(params[:id]).followed
  current_user.unfollow!(@user)
  end
end
