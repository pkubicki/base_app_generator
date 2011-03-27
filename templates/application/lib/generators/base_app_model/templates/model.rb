class <%= class_name %> < <%= parent_class_name.classify %>
  begin # settings
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
    belongs_to :<%= attribute.name %>
<% end -%>
    cattr_accessor :per_page
    self.per_page = 10
  end

  begin # validations
<% attributes.each do |attribute| -%>
    # validates :<%= attribute.name %>, 
    #   :presence => true,
<% if attribute.string? && attribute.text? -%>
    #   :length => {:maximum => 255}
<% end -%>
<% end -%>
  end
  
end
