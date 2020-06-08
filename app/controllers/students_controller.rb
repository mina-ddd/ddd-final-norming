class StudentsController < ApplicationController

  def new_registration_form
    render({ :template => "students/signup_form.html.erb" })
  end
  
  def authenticate
    # get the usernamer from params
    un = params.fetch("query_username")
    # get the password from params
    pw = params.fetch("query_password")
    
    # look up the recordfrom the db matching username
    @student = Student.where({ :name => un}).at(0)

    # if there's no record, redirect back to sign in form
    if @student == nil
      redirect_to("/", { :notice => "The username or password is incorrect. Try again!"})
    else
    # if there is a record, check to see if password matches]
      if  @student.authenticate(pw)
      # if so, set the cookie
        session.store(:path_id, @student.id)
      # redirect to homepage
        redirect_to("/students/id/#{@student.id}")
      else   
      # if not, redirect back to sign in form
        redirect_to("/", { :notice => "The username or password is incorrect. Try again!"})
      end
    end
  end

  def sign_in_form
    render({ :template => "students/signin_form.html.erb" })
  end

  def toast_cookie
    reset_session
    redirect_to("/", { :notice => "See you later!"})
  end

  def index
    @students = Student.all.order({ :created_at => :desc })

    render({ :template => "students/index.html.erb" })
  end

  def show
    # the_c_id = params.fetch("course_id")
    # @course = Course.where({:id => the_c_id }).at(0)
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)
    # @norming_sheets = NormingSheet.where({ :student_id => @student }).at(0)
    @norming_sheets = NormingSheet.where({ :student_id => @student }).order({ :created_at => :desc })
    render({ :template => "students/show.html.erb" })
  end

  def create
    @student = Student.new
    @student.name = params.fetch("query_name")
    @student.password = params.fetch("query_password")
    # @student.password_confirmation = params.fetch("input_password_confirmation")
    

    if @student.valid?
      @student.save
      redirect_to("/students/id/#{@student.id}", { :notice => "Student created successfully." })
    else
      redirect_to("/insert_student", { :notice => "Student failed to create successfully." })
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

    redirect_to("/", { :notice => "Student deleted successfully."} )
  end
end
