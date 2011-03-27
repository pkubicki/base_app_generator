ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  unless html_tag =~ /<label/
    %|<div class="field-error">#{html_tag} <p class="inline-errors">#{[instance.error_message].join(', ')}</p></div>|.html_safe
  else
    html_tag
  end
end

