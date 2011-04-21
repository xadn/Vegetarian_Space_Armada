module DestroyersHelper

  def destroyer_div(destroyer)
     "destroyer_description#{destroyer.id}"
  end
  
  def more_link_div(destroyer)
    "more_link#{destroyer.id}"
  end
  
  def toggle_more(destroyer)
    link_to_function("more...", :id => "more_link") do |page|
       page[ destroyer_div(destroyer) ].toggle
       page["#{destroyer_div(destroyer)}_more"].toggle
       #page[ more_link_div(destroyer) ].replace_html "Show me less"
    end
  end

end