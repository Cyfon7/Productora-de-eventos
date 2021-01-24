class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new

  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group has been created.'}
      else
        format.html { render :new }
      end
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def group_params
      params.require(:group).permit(:group_name, :num_of_members, :debut_date, :group_type)
    end

end