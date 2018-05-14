
# encoding: utf-8

class Result < ActiveRecord::Base

  # has_many:tekiyourecords

  # 検索のためのメソッドを定義
  # https://qiita.com/budougumi0617/items/d98fc15adea4dab438e7
  # 複数キーワードに対応
  # https://qiita.com/ihatov08/items/461408896598bcc99cba

  def self.search(search) #クラスメソッド
    if search # Controllerから渡されたパラメータが != nilの場合は、titleカラムを部分一致検索
      patterns = search.split(/[ ,　]/)
      sql_body = ''
      patterns.each do | pattern |
        sql_body += ' and ' unless sql_body.blank?
        sql_body += "name like '%#{pattern}%' "
      end
      # sql = "select 'results'.* from 'results' where (#{sql_body})"
      sql_where = "#{sql_body}"

      # Result.find_by_sql(sql) -- sqlによる検索 : to_csvに影響(utf-8)
      # Result.where(['name LIKE ?', "%#{search}%"]) -- whereによる検索 : 複数キーワードが不可能
      Result.where("#{sql_where}")  # -- whereによる検索 : 複数キーワードに対応
    else
      Result.all #全て表示。
    end
  end


  # csvデータDLのためのメソッドを定義
  # http://ruby-rails.hatenadiary.com/entry/20141119/1416398472

  def self.to_csv
    CSV.generate do |csv|
      col_names = ["name", "kokuho_res1", "kokuho_res2", "kokuho_res3", "kouki_res1", "kouki_res2", "kouki_res3"]
      col_names_label = ["keyword", "国保レセプト枚数", "国保患者数", "国保LTC利用者数", "後期レセプト枚数", "後期患者数", "後期LTC利用者数"]
      csv << col_names_label
      all.each do |res_temp|
        csv << res_temp.attributes.values_at(*col_names)
      end
    end
  end


end
