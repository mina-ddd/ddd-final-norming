class CoursesController < ApplicationController
  def index
    the_id = params.fetch("path_id")
    @course = Course.where({:id => the_id}).at(0)
    # @student = Student.where({:id => the_id }).at(0)
    @courses = Course.all.order({ :created_at => :desc })
   

    render({ :template => "courses/index.html.erb" })
  end

  def list
    # the_n_id = params.fetch("sheet_id")
    # @norming_sheet = NormingSheet.where({:id => the_n_id }).at(0)
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)
    # the_c_id = params.fetch("sheet_id")
    # @course = Course.where({:id => the_c_id }).at(0)
    # the_s_id = params.fetch("sheet_id")
    # @norming_sheet = NormingSheet.where({:id => the_s_id }).at(0)
    @own_courses = Course.where({ :student_id => @student }).order({ :created_at => :desc })
    render({ :template => "courses/list.html.erb" })
  end
  
  def show_course
    @norming_sheets = NormingSheet.all.order({ :created_at => :desc })
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)
    the_c_id = params.fetch("sheet_id")
    @course = Course.where({:id => the_c_id }).at(0)
    @courses = Course.all.order({ :created_at => :desc })

    render({ :template => "courses/show.html.erb" })
  end
  
  def show
    the_id = params.fetch("sheet_id")
    @course = Course.where({:id => the_id }).at(0)

    render({ :template => "courses/show.html.erb" })
  end

  def create
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)
    @course = Course.new
    @course.year = params.fetch("query_year")
    @course.quarter = params.fetch("query_quarter")
    @course.course_name = params.fetch("query_course_name")
    @course.group_number = params.fetch("query_group_number")
    @course.student_id = params.fetch("query_student_id")
    if @course.valid?
      @course.save
      redirect_to("/courses/id/#{@student.id}", { :notice => "Course created successfully." })
    else
      redirect_to("/courses/id/#{@student.id}", { :notice => "Course failed to create successfully." })
    end
  end

  def update
    the_s_id= params.fetch("path_id")
    @student = Student.where({ :id => the_s_id}).at(0)
    the_id = params.fetch("course_id")
    @course = Course.where({ :id => the_id }).at(0)

    @course.year = params.fetch("query_year")
    @course.quarter = params.fetch("query_quarter")
    @course.course_name = params.fetch("query_course_name")
    @course.group_number = params.fetch("query_group_number")

    if @course.valid?
      @course.save
      redirect_to("/courses/id/#{@course.student_id}/course_list", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/id/#{@course.student_id}/course_list", { :alert => "Course failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    @course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
