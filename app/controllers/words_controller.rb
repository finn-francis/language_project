# frozen_string_literal: true

class WordsController < ApplicationController
  def show
    @word = Word.includes(:sentences).find(params[:id])
  end
end
