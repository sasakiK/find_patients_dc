class DownloadsController < ApplicationController


  def index
  end

  def download
    @patients = Result.find_by(id: params[:id])
    @dl_patients = Tekiyourecord.all
    @patients_count = @dl_patients.distinct.count(:himoID)
  end


end
