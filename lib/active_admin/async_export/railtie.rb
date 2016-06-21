module ActiveAdmin
  module AsyncExport
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        begin
          if Mime::Type.lookup_by_extension(:email).nil?
            # The mime type to be used in respond_to |format| style web-services in rails
            Mime::Type.register 'application/email_export', :email, []
          end
        rescue NameError
          # noop
        end

        ActiveAdmin::ResourceController.class_eval do
          include ActiveAdmin::AsyncExport::ResourceControllerExtension
        end
        ActiveAdmin::Views::PaginatedCollection.add_format :email
      end
    end
  end
end
