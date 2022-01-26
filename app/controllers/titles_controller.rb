class TitlesController < ApplicationController
  def index
    filters = params.permit(:release_year, :type, :country).to_h
    render json: Serializer.json_response(filters)
  end

  def create
    csv_file = params[:csv_file]
    Handlers::CsvHandler.handle_csv(csv_file)

    render json: { status: 'Ok', response: 'Titles added' }
  end
end
