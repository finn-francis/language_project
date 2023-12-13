# frozen_string_literal: true

class UserLanguagesController < ApplicationController
  def new
    @unlearned_languages = unlearned_languages.pluck(:name, :id)
  end

  def create
    @current_language = unlearned_languages.index_by(&:id)[params.dig(:user_language, :language).to_i]
    current_user.user_languages.create(language: @current_language, current: true)
  end

  private

  def unlearned_languages
    # TODO: Make this a single query
    @unlearned_languages = Language.select(:id, :name).where.not(id: current_user.languages.pluck(:id))
  end
end
