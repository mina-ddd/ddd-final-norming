class NormingSheetsController < ApplicationController

  def index
    @norming_sheets = NormingSheet.all.order({ :created_at => :desc })
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)
    # @norming_sheet = NormingSheet.where({:student_id => the_id }).at(0)
    the_c_id = params.fetch("course_id")
    @course = Course.where({:id => the_c_id }).at(0)
    @courses = Course.all.order({ :created_at => :desc })
    render({ :template => "norming_sheets/index.html.erb" })
  end

  def show_course
    @norming_sheets = NormingSheet.all.order({ :created_at => :desc })
     the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)
    the_s_id = params.fetch("sheet_id")
    @norming_sheet = NormingSheet.where({:id => the_s_id }).at(0)

    render({ :template => "norming_sheets/index.html.erb" })
  end

  def show
    the_s_id = params.fetch("path_id")
    @student = Student.where({:id => the_s_id }).at(0)
    the_id = params.fetch("sheet_id")
    @norming_sheet = NormingSheet.where({:id => the_id }).at(0)
    # the_c_id = params.fetch("course_id")
    # @course = Course.where({:id => the_c_id }).at(0)

    render({ :template => "norming_sheets/show.html.erb" })
  end

#  def create
#     @norming_sheet = NormingSheet.new
#     @norming_sheet.student_id = params.fetch("query_student_id")
#     @norming_sheet.student_id = params.fetch("query_personality")
#     @norming_sheet.student_id = params.fetch("query_query_working_style")
#     @norming_sheet.student_id = params.fetch("query_life_beyond_kellogg")

#     if @norming_sheet.valid?
#       @norming_sheet.save
#       redirect_to("/norming_sheets", { :notice => "Norming sheet list created successfully." })
#     else
#       redirect_to("/norming_sheets", { :notice => "Norming sheet list failed to create successfully." })
#     end
#   end

  def create
    # the_c_id = params.fetch("course_id")
    # @course = Course.where({:id => the_c_id }).at(0)
    the_s_id = params.fetch("query_student_id")
    @student = Student.where({:id => the_s_id }).at(0)
    @norming_sheet = NormingSheet.new
    @norming_sheet.student_id = params.fetch("query_student_id")
    @norming_sheet.personality = params.fetch("query_personality")
    @norming_sheet.working_style = params.fetch("query_working_style")
    @norming_sheet.life_beyond_kellogg = params.fetch("query_life_beyond_kellogg")
    @norming_sheet.development_goals = params.fetch("query_development_goals")
    @norming_sheet.hidden_superpower = params.fetch("query_hidden_superpower")
    @norming_sheet.title = params.fetch("query_class_name")
    # @norming_sheet.sheet_list_id = params.fetch("query_sheet_list_id")

    if @norming_sheet.valid?
      @norming_sheet.save
      redirect_to("/norming_sheets/userid/#{@student.id}/sheet/#{@norming_sheet.id}", { :notice => "Norming sheet created successfully." })
    else
      redirect_to("/norming_sheets/userid/#{@student.id}", { :notice => "Norming sheet failed to create successfully." })
    end
  end

  def update
    @course = Course.where({:id => @norming_sheet.class_id }).at(0)
    the_s_id = params.fetch("path_id")
    @student = Student.where({:id => the_s_id }).at(0)
    the_id = params.fetch("sheet_id")
    @norming_sheet = NormingSheet.where({ :id => the_id }).at(0)

    @norming_sheet.personality = params.fetch("query_personality")
    @norming_sheet.working_style = params.fetch("query_working_style")
    @norming_sheet.life_beyond_kellogg = params.fetch("query_life_beyond_kellogg")
    @norming_sheet.development_goals = params.fetch("query_development_goals")
    @norming_sheet.hidden_superpower = params.fetch("query_hidden_superpower")
    @norming_sheet.class_id = params.fetch("query_class_id")
    # @norming_sheet.sheet_list_id = params.fetch("query_sheet_list_id")

    if @norming_sheet.valid?
      @norming_sheet.save
      redirect_to("/norming_sheets/userid/#{@student.id}/course/#{@norming_sheet.id}", { :notice => "Norming sheet updated successfully."} )
    else
      redirect_to("/norming_sheets/userid/#{@student.id}/course/#{@norming_sheet.id}", { :alert => "Norming sheet failed to update successfully." })
    end
  end

  def destroy
    the_s_id = params.fetch("sheet_id")
    @norming_sheet = NormingSheet.where({ :id => the_s_id }).at(0)

    @norming_sheet.destroy
     the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)

    redirect_to("/students/id/#{@student.id}>", { :notice => "Norming sheet deleted successfully."} )
  end
end
