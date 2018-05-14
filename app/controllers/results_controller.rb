require 'csv'

class ResultsController < ApplicationController

  def index
    if params[:search].present? # 検索キーワードが空でなければ
      @results = Result.search(params[:search]) # searchメソッドを呼び出す
      temp_result = @results
      respond_to do |format|
        format.html
        format.csv {send_csv temp_result.to_csv}
      end
      @judge = @results.length
      @exist = "exist"
    else # 検索キーワードが空であれば
      @exist = "none" #@judgeに1をわたす
    end
  end


  def download
    @patients = Result.find_by(id: params[:id])
  end

end
