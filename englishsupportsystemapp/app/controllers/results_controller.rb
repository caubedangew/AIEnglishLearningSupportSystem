class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def show
    @details = ResultDetail.where(result_id: params[:id]).all
  end
end
