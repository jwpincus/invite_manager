module DeviseHelper
  def devise_error_messages!
    flash[:error] = resource.errors.full_messages.map { |msg|  msg }.join if resource.errors.messages.length > 0
  end

end