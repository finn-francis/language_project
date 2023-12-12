# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  helper_method :view_object

  def view_object
    @view_object ||= { current_user: current_user.as_json.symbolize_keys }
  end
end
