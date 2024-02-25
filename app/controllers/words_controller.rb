# frozen_string_literal: true

class WordsController < ApplicationController
  def show
    @word = Word.includes(:sentences, :user_words).find_by(name: params[:slug])
    @user_word = @word.user_words.find_by(user: current_user)
  end
end
