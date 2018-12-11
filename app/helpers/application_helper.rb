module ApplicationHelper

 def alert_class(flash_name)
    if flash_name == "success"
      return "alert-success"
    elsif flash_name == "error"
      return "alert-warning"
    elsif flash_name == "notice"
    	return "alert-success"
    elsif flash_name == "alert"
    	return "alert-danger"
    else
      return nil
    end
  end
end
