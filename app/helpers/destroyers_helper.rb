module DestroyersHelper

  def destroyer_div(destroyer)
     "destroyer_description#{destroyer.id}"
  end
  
  def more_link_div(destroyer)
    "more_link#{destroyer.id}"
  end
  
  def description_and_more(destroyer)
    render :partial => '/destroyers/description', :locals => {:destroyer => destroyer}
  end
  
  def toggle_more(destroyer)
    if (destroyer.description.length > 45)
      link_to_function "more...", :id => more_link_div(destroyer) do |page|
         page[ destroyer_div(destroyer) ].toggle
         page["#{destroyer_div(destroyer)}_more"].toggle
      end
    end
  end
  
end