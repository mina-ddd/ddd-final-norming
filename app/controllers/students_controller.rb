class StudentsController < ApplicationController
  def index
    @students = Student.all.order({ :created_at => :desc })

    render({ :template => "students/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)

    render({ :template => "students/show.html.erb" })
  end

  def create
    @student = Student.new
    @student.name = params.fetch("query_name")
    @student.password = params.fetch("query_password")
    
    if @student.valid?
      @student.save
      redirect_to("/students", { :notice => "Student created successfully." })
    else
      redirect_to("/students", { :notice => "Student failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @student = Student.where({ :id => the_id }).at(0)

    @student.name = params.fetch("query_name")
    @student.password = params.fetch("query_password")

    if @student.valid?
      @student.save
      redirect_to("/students/#{@student.id}", { :notice => "Student updated successfully."} )
    else
      redirect_to("/students/#{@student.id}", { :alert => "Student failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @student = Student.where({ :id => the_id }).at(0)

    @student.destroy

    redirect_to("/students", { :notice => "Student deleted successfully."} )
  end
end
