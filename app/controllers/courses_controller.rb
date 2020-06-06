class CoursesController < ApplicationController
  def index
    @courses = Course.all.order({ :created_at => :desc })

    render({ :template => "courses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @course = Course.where({:id => the_id }).at(0)

    render({ :template => "courses/show.html.erb" })
  end

  def create
    @course = Course.new
    @course.year = params.fetch("query_year")
    @course.quarter = params.fetch("query_quarter")
    @course.course_name = params.fetch("query_course_name")
    @course.group_number = params.fetch("query_group_number")

    if @course.valid?
      @course.save
      redirect_to("/courses", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :notice => "Course failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    @course.year = params.fetch("query_year")
    @course.quarter = params.fetch("query_quarter")
    @course.course_name = params.fetch("query_course_name")
    @course.group_number = params.fetch("query_group_number")

    if @course.valid?
      @course.save
      redirect_to("/courses/#{@course.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/#{@course.id}", { :alert => "Course failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    @course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
