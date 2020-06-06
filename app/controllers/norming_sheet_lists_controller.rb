class NormingSheetListsController < ApplicationController
  def index
    @norming_sheet_lists = NormingSheetList.all.order({ :created_at => :desc })

    render({ :template => "norming_sheet_lists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @norming_sheet_list = NormingSheetList.where({:id => the_id }).at(0)

    render({ :template => "norming_sheet_lists/show.html.erb" })
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

  def update
    the_id = params.fetch("path_id")
    @norming_sheet_list = NormingSheetList.where({ :id => the_id }).at(0)

    @norming_sheet_list.student_id = params.fetch("query_student_id")

    if @norming_sheet_list.valid?
      @norming_sheet_list.save
      redirect_to("/norming_sheet_lists/#{@norming_sheet_list.id}", { :notice => "Norming sheet list updated successfully."} )
    else
      redirect_to("/norming_sheet_lists/#{@norming_sheet_list.id}", { :alert => "Norming sheet list failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @norming_sheet_list = NormingSheetList.where({ :id => the_id }).at(0)

    @norming_sheet_list.destroy

    redirect_to("/norming_sheet_lists", { :notice => "Norming sheet list deleted successfully."} )
  end
end
