class PagesController < ApplicationController
   def home
      @islogged = loggedIn?()
   end

   def about
   end

   def logout
      session.delete(:current_user_id)
      redirect_to '/'
   end

end