class ApplicationController < ActionController::Base
    #Whatever method defined in application controller will be available to all controllers of the app.
   
    #Designating current_user method as helper method so that it will be available in view component.
    helper_method :current_user, :logged_in?
    
    def current_user
        #Memorization, when method called every time it will query the database. Instead if we already have current 
        #user information then it will directly return using instance variable w/o querying database.
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #Making boolean argument
        !!current_user
      end
end
