module ApplicationHelper
    def gravatar_for(user, options = { size: 80})
      email_address = user.email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      size = options[:size]
      gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
      image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

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
