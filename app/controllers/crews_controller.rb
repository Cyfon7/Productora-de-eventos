class CrewsController < ApplicationController
    def index
      @group = Group.find(params[:group_id])
      @crews = @group.crews
    end
    
    def new
      @group = Group.find(params[:group_id])

      @crew = Crew.new
    end
  
    def create
      @group = Group.find(params[:group_id])

      @crew = Crew.new(crew_params)
  
      @crew.group = @group
      respond_to do |format|
        if @crew.save
          format.html { redirect_to group_crew_path(@group, @crew), notice: 'Crew has been created.'}
        else
          format.html { render :new }
        end
      end
    end
  
    def show
      @group = Group.find(params[:group_id])
      @crew = Crew.find(params[:id])
    end
  
    def edit
      @group = Group.find(params[:group_id])
      @crew = Crew.find(params[:id])
    end
  
    def update
      @group = Group.find(params[:group_id])
      @crew = Crew.find(params[:id])
  
      respond_to do |format|
        if @crew.update(crew_params.merge(group: @group))
          format.html { redirect_to group_crew_path(@group, @crew), notice: 'Crew was successfully updated.' }
        else
          format.html { render :edit }
        end
       end
    end
  
    def destroy
      @crew = Crew.find(params[:id])
      @crew.destroy
      respond_to do |format|
        format.html { redirect_to group_crews_url, notice: 'Crew was successfully destroyed.' }
      end
    end
  
    private
      def crew_params
        params.require(:crew).permit(:name)
      end
end