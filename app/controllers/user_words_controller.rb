# frozen_string_literal: true

class UserWordsController < ApplicationController
  def update
    user_word = current_user.user_words.find(params[:id])
    user_word.update(user_word_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def user_word_params
    params.require(:user_word).permit(:status)
  end
end
