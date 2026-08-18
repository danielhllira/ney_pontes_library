class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :authenticate_librarian!
  before_action :require_password_change
  
  skip_before_action :authenticate_librarian!, if: :devise_controller?

  private

  def require_password_change
    return if devise_controller?
    return unless librarian_signed_in? && current_librarian.must_change_password?

    redirect_to edit_password_update_path
  end

end
