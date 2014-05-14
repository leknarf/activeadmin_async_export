module ActiveAdmin
  module AsyncExport
    module ResourceControllerExtension
      def self.included(base)
        base.send :alias_method_chain, :index, :email
        base.send :respond_to, :email
      end

      def index_with_email(options={}, &block)
        index_without_email(options) do |format|
          format.email do
            current_user_method = active_admin_config.namespace.application.current_user_method
            admin_email = send(current_user_method).email

            ActiveAdmin::AsyncExport::AsyncExportMailer.delay.csv_export(admin_email, collection.first.class.to_s, csv_collection)
            redirect_to :back, notice: "CSV export emailed to #{admin_email}!"
          end
        end
      end

      def csv_collection
        collection = scoped_collection

        collection = apply_authorization_scope(collection)
        collection = apply_sorting(collection)
        collection = apply_filtering(collection)
        collection = apply_scoping(collection)
        collection.to_a
      end

    end
  end
end
