class RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    if resource.email == 'guest1@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません'
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end