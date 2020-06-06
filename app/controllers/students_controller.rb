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
    user = Student.where({ :name => un}).at(0)

    # if there's no record, redirect back to sign in form
    if user == nil
      redirect_to("/user_sign_in")
    else
    # if there is a record, check to see if password matches]
      if  user.authenticate(pw)
      # if so, set the cookie
        session.store(:user_id, user.id)
      # redirect to homepage
        redirect_to("/")
      else   
      # if not, redirect back to sign in form
        redirect_to("/user_sign_in")
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
    the_id = params.fetch("path_id")
    @student = Student.where({:id => the_id }).at(0)

    render({ :template => "students/show.html.erb" })
  end

  def create
    @student = Student.new
    @student.name = params.fetch("query_name")
    @student.password_digest = params.fetch("query_password")
    # @student.password_confirmation = params.fetch("input_password_confirmation")
    

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
