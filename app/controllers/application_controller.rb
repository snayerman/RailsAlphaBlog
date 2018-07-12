class ApplicationController < ActionController::Base
   def loggedIn?
      session[:current_user_id] != nil
   end

   def getCurrUser
      if loggedIn?
         User.find(session[:current_user_id])
      end
   end

   helper_method :loggedIn?, :getCurrUser
end
