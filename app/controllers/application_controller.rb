# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  helper_method :view_object

  def current_language
    current_user.languages.current.first
  end

  def view_object
    @view_object ||= {
      current_user: current_user.as_json.symbolize_keys,
      current_language: current_language.as_json&.symbolize_keys
    }
  end
end
