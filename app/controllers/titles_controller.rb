require 'csv'

class TitlesController < ApplicationController
  def index
    @titles = Title.all
    render json: @titles
  end

  def create
    csv_file = params[:csv_file]
    Handlers::CsvHandler.handle_csv(csv_file)

    render json: { status: 'Ok', response: 'Titles added' }
  end
end
