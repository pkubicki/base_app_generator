class <%= class_name %> < <%= parent_class_name.classify %>
<% if (attributes.select {|attr| attr.reference? }).length > 0 %>  # relations<% end -%>
<% attributes.select {|attr| attr.reference? }.each do |attribute| %>
  belongs_to :<%= attribute.name %>
<% end %>
  # settings
  cattr_accessor :per_page
  self.per_page = 10
  attr_accessible <%= attributes.map {|attr| ":#{attr.name}"}.join(",\n    ") %>
    
  # validations
<% attributes.each do |attribute| -%>
  # validates :<%= attribute.name %>, 
  #   :presence => true<% if attribute.string? -%>,
  #   :length => {:maximum => 255}<% end %>
<% end -%>
  
end
