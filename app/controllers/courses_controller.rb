# frozen_string_literal: true

# TODO(Finn): Before this ever goes to production this should all be scoped to the current user.
class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
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
end
