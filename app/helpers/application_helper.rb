module ApplicationHelper
  def alert(flash_type)
    case flash_type.to_sym
    when :success
      'alert-success'
    when :error
      'alert-error'
    when :prymary
      'alert-prymary'
    when :warning
      'alert-warning'
    else
      flash_type.to_s
    end
  end
end
