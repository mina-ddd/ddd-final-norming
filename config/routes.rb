Rails.application.routes.draw do

  # Routes for the Student resource:
  get("/user_sign_up", {:controller => "students", :action => "new_registration_form"})
  get("/user_sign_out", {:controller => "students", :action => "toast_cookie"})
  get("/user_sign_in", {:controller => "students", :action => "sign_in_form"})
  post("/verify_credentials", { :controller => "students", :action => "authenticate"})
  
  # CREATE
  get("/insert_student", { :controller => "students", :action => "create" })
          
  # READ
  get("/students", { :controller => "students", :action => "index" })
  
  get("/students/id/:path_id", { :controller => "students", :action => "show" })
  
  # UPDATE

  get("/modify_student/:path_id", { :controller => "students", :action => "update" })
  
  # DELETE
  get("/delete_student/:path_id", { :controller => "students", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "home", :action => "index"})

  # Routes for the Norming sheet resource:

  # CREATE
  post("/insert_norming_sheet", { :controller => "norming_sheets", :action => "create" })
  
          
  # READ
  get("/norming_sheets/userid/:path_id", { :controller => "norming_sheets", :action => "index" })
  get("/norming_sheets/userid/:path_id/course/:sheet_id", { :controller => "norming_sheets", :action => "show_course" })
  get("/norming_sheets/userid/:path_id/sheet/:sheet_id", { :controller => "norming_sheets", :action => "show" })
  
  # UPDATE
  
  post("/modify_norming_sheet/userid/:path_id/sheet/:sheet_id", { :controller => "norming_sheets", :action => "update" })
  
  # DELETE
  get("/delete_norming_sheet/id/:path_id/:sheet_id", { :controller => "norming_sheets", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course/id/:path_id", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses/id/:path_id", { :controller => "courses", :action => "index" })
  get("/courses/id/:path_id/course_list", { :controller => "courses", :action => "list" })  
  get("/courses/user/:path_id/course/:sheet_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the Norming sheet list resource:

  # CREATE
  get("/insert_norming_sheet_list", { :controller => "norming_sheet_lists", :action => "create" })
  #もともとPost
          
  # READ
  get("/norming_sheet_lists", { :controller => "norming_sheet_lists", :action => "index" })
  
  get("/norming_sheet_lists/:path_id", { :controller => "norming_sheet_lists", :action => "show" })
  
  # UPDATE
  
  post("/modify_norming_sheet_list/:path_id", { :controller => "norming_sheet_lists", :action => "update" })
  
  # DELETE
  get("/delete_norming_sheet_list/:path_id", { :controller => "norming_sheet_lists", :action => "destroy" })

  #------------------------------

end
