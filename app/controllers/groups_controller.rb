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

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_path(@group), notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private
    def group_params
      params.require(:group).permit(:group_name, :num_of_members, :debut_date, :group_type, crews_attributes:[:id, :name, :_destroy])
    end

end