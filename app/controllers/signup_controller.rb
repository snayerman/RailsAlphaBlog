class SignupController < ApplicationController
   def show
      @user = User.new()
   end

   def create
      @user = User.new(user_params())

      if @user.save()
         # flash[:notice] = "User was successfuly created!"
         session[:current_user_id] = @user.id;
         redirect_to articles_path
         puts "Current session is: #{session}"
      else
         render 'show'
      end
   end

   private
   def user_params()
      params.require(:user).permit(:username, :email)
   end
end