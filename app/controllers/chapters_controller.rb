# frozen_string_literal: true

class ChaptersController < CoursesController
  before_action :find_course

  def show
    find_chapter
  end

  def new
    @chapter = @course.chapters.build
  end

  def create
    build_chapter
    if @chapter.valid?
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name)
  end

  def find_chapter
    @chapter = @course.chapters.find(params[:id])
  end

  def build_chapter
    @chapter = @course.chapters.build(chapter_params)
    Chapters::Ingest.call(@chapter, params[:raw_text])
  end
end
