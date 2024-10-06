class ResultDetailsController < AdminController
  def edit
    @detail = ResultDetail.find(params[:id])
  end

  def update
    @detail = ResultDetail.find(params[:id])

    if @detail.update(detail_params)
      redirect_to "/results/:id"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def detail_params
      params.require(:detail).permit(:score, :time)
    end
end
