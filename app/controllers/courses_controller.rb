# frozen_string_literal: true

# TODO(Finn): Before this ever goes to production this should all be scoped to the current user.
class CoursesController < ApplicationController
  def index
    @courses = Course.where(type: nil).all
  end

  def show
    find_course
    find_most_common_words
  end

  def new
    @course = Course.new
  end

  def create
    course = Course.create(course_params)
    redirect_to course_path(course)
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end

  def find_course
    @course = Course.includes(chapters: { paragraphs: :sentences }).find(params[:course_id] || params[:id])
  end

  def find_most_common_words
    sentences = @course.chapters.flat_map(&:paragraphs).flat_map(&:sentences)

    # Brings back all the words in the course, sorted by frequency.
    # It returns a list of words with their id, name, and frequency.
    word_counts = Word.joins(:sentence_words)
                      .where(sentence_words: { sentence: sentences })
                      .group(:id)
                      .order('count_all DESC')
                      .count

    # Brings back all the words in the course, sorted by frequency.
    user_words = current_user.user_words
                             .includes(:word)
                             .joins(:word)
                             .where(word_id: word_counts.keys)
                             .where('(user_words.status != ? AND user_words.status != ?) OR user_words.status IS NULL',
                                    UserWord::STATUS_VALUES[:learned],
                                    UserWord::STATUS_VALUES[:ignore])
                             .each { |user_word| user_word.word.frequency = word_counts[user_word.word_id] }
    @most_common_words = user_words.sort_by { _1.word.frequency }.reverse.first(100)
  end
end
