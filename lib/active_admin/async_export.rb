require 'active_admin'
require 'active_admin/async_export/build_download_format_links'
require 'active_admin/async_export/version'
require 'active_admin/async_export/resource_controller_extension'
require 'active_admin/async_export/async_export_mailer'
require 'active_admin/async_export/railtie'

module ActiveAdmin
  module AsyncExport
    def self.from_email_address=(address)
      @from_email_address = address
    end

    def self.from_email_address
      @from_email_address || 'admin@example.com'
    end

    def self.controller_namespace=(namespace)
      @controller_namespace = namespace
    end

    def self.controller_namespace
      @controller_namespace || 'Admin'
    end
  end
end
