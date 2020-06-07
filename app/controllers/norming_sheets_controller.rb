class NormingSheetsController < ApplicationController
  def index
    @norming_sheets = NormingSheet.all.order({ :created_at => :desc })

    render({ :template => "norming_sheets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @norming_sheet = NormingSheet.where({:id => the_id }).at(0)

    render({ :template => "norming_sheets/show.html.erb" })
  end

 def create
    @norming_sheet_list = NormingSheetList.new
    @norming_sheet_list.student_id = params.fetch("query_student_id")

    if @norming_sheet_list.valid?
      @norming_sheet_list.save
      redirect_to("/norming_sheet_lists", { :notice => "Norming sheet list created successfully." })
    else
      redirect_to("/norming_sheet_lists", { :notice => "Norming sheet list failed to create successfully." })
    end
  end

  # def create
  #   @norming_sheet = NormingSheet.new
  #   @norming_sheet.personality = params.fetch("query_personality")
  #   @norming_sheet.working_style = params.fetch("query_working_style")
  #   @norming_sheet.life_beyond_kellogg = params.fetch("query_life_beyond_kellogg")
  #   @norming_sheet.development_goals = params.fetch("query_development_goals")
  #   @norming_sheet.hidden_superpower = params.fetch("query_hidden_superpower")
  #   @norming_sheet.class_id = params.fetch("query_class_id")
  #   @norming_sheet.sheet_list_id = params.fetch("query_sheet_list_id")

  #   if @norming_sheet.valid?
  #     @norming_sheet.save
  #     redirect_to("/norming_sheets", { :notice => "Norming sheet created successfully." })
  #   else
  #     redirect_to("/norming_sheets", { :notice => "Norming sheet failed to create successfully." })
  #   end
  # end

  def update
    the_id = params.fetch("path_id")
    @norming_sheet = NormingSheet.where({ :id => the_id }).at(0)

    @norming_sheet.personality = params.fetch("query_personality")
    @norming_sheet.working_style = params.fetch("query_working_style")
    @norming_sheet.life_beyond_kellogg = params.fetch("query_life_beyond_kellogg")
    @norming_sheet.development_goals = params.fetch("query_development_goals")
    @norming_sheet.hidden_superpower = params.fetch("query_hidden_superpower")
    @norming_sheet.class_id = params.fetch("query_class_id")
    @norming_sheet.sheet_list_id = params.fetch("query_sheet_list_id")

    if @norming_sheet.valid?
      @norming_sheet.save
      redirect_to("/norming_sheets/#{@norming_sheet.id}", { :notice => "Norming sheet updated successfully."} )
    else
      redirect_to("/norming_sheets/#{@norming_sheet.id}", { :alert => "Norming sheet failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @norming_sheet = NormingSheet.where({ :id => the_id }).at(0)

    @norming_sheet.destroy

    redirect_to("/norming_sheets", { :notice => "Norming sheet deleted successfully."} )
  end
end
