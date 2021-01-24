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

  def edit
    @concert = Concert.find(params[:id])
    @groups = Group.all
  end

  def update
    @concert = Concert.find(params[:id])

    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to concert_path(@concert), notice: 'Concert was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
    end
  end

  private
    def concert_params
      params.require(:concert).permit(:concert_title, :num_of_attendants, :concert_date, :group_id, :concert_starts_at, :concert_ends_at)
    end

end
