class LoginController < ApplicationController
   def show
      @user = User.new()
   end

   def create
      @user = User.find_by(user_params())

      if @user
         session[:current_user_id] = @user.id
         redirect_to articles_path
      else
         flash[:notice] = "Invalid username/email"
         redirect_to login_path
         # @user.errors.add(:base, :username_or_email_invalid, message: "Invalid username/email")
      end
   end

   private
   def user_params()
      params.require(:user).permit(:username, :email)
   end

end
