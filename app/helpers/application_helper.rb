module ApplicationHelper
  def bootstrap_class_for flash_type #Bootstrap alert helper class
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
  def sortable(column, title = nil)  
    title ||= column.titleize  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, :sort => column, :direction => direction  
  end
end
