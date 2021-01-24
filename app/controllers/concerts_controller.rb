class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end
  
  def new
    @concert = Concert.new
    @groups = Group.all
  end

  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: 'Concert has been created.'}
      else
        format.html { render :new }
      end
    end
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def concert_params
      params.require(:concert).permit(:concert_title, :num_of_attendants, :concert_date, :group_id)
    end

end
