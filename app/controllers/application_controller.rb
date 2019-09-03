class ApplicationController < ActionController::Base

  before_action :set_locale

  def after_sign_in_path_for(_user)
    return admin_tests_path if current_user.admin?
    root_path
  end

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
