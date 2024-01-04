class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :authenticate_user!

  protected

  def switch_locale(&action)
    I18n.with_locale(locale_from_header, &action)
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  private

  def locale_from_header
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    return I18n.default_locale unless accept_language

    accept_language.scan(/^[a-z]{2}/).first
  end
end
