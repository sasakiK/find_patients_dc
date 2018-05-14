module ApplicationHelper

  # stackoverflowによるとbutton_to_functionはremovedらしい
  # https://stackoverflow.com/questions/30656032/why-is-button-to-function-method-undefined-ror
  def button_to_function(name, function=nil, html_options={}, button_id)
    message = "button_to_function is deprecated and will be removed from Rails 4.1. We recommend using Unobtrusive JavaScript instead. " +
      "See http://guides.rubyonrails.org/working_with_javascript_in_rails.html#unobtrusive-javascript"
    ActiveSupport::Deprecation.warn message

    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function};"

    tag(:input, html_options.merge(:type => 'button', :value => name, :onclick => onclick, :id => button_id))
  end

  # csv出力ボタンを実装する
  # http://www.ohmyenter.com/%E3%80%90%E5%AE%9F%E8%B7%B5%E3%80%91rails%E3%81%AB%E3%81%A6%E6%A4%9C%E7%B4%A2%E7%B5%90%E6%9E%9C%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BEcsv%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%EF%BC%88%E3%82%84/
  def button_to_csv(options = {})
    button_to_function "検索結果を保存する", "reloadWithFormat('csv');", options, "save_button"
  end

end
