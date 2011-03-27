module AdministratorsHelper

  def prepare_administrator(administroator)
    administroator.tap do |a|
      a.build_user if a.user.nil?
    end
  end

end

