# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#It stop adding dynamic divs in Error Messages
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
  end
