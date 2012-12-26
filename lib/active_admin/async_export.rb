require 'active_admin'
require 'active_admin/async_export/build_download_format_links'
require 'active_admin/async_export/version'
require 'active_admin/async_export/resource_controller_extension'
require 'active_admin/async_export/async_export_mailer'

module ActiveAdmin
  module AsyncExport
    def self.from_email_address=(address)
      @from_email_address = address
    end

    def self.from_email_address
      @from_email_address || 'admin@example.com'
    end
  end
end

class Railtie < ::Rails::Railtie
  initializer "active admin async export initalization" do
    begin
      if Mime::Type.lookup_by_extension(:email).nil?
        # The mime type to be used in respond_to |format| style web-services in rails
        Mime::Type.register 'application/email_export', :email, []
      end
    rescue NameError
      # noop
    end

    ActiveAdmin::ResourceController.send :include, ActiveAdmin::AsyncExport::ResourceControllerExtension
    ActiveAdmin::Views::PaginatedCollection.add_format :email
  end
end
