class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

    def send_csv(csv, options = {})
      bom = "   "
      bom.setbyte(0, 0xEF)
      bom.setbyte(1, 0xBB)
      bom.setbyte(2, 0xBF)
      send_data bom + csv.to_s, options
    end

end
