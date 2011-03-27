YamledAcl.setup do |config|
  config.files_with_permissions_path = 'config/acl'
  config.reload_permissions_on_each_request = Rails.env.development?
  config.groups = %w(administrator)
  config.guest_group_name = 'guest'
end
