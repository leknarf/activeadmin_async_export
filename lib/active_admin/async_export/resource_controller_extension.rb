module ActiveAdmin
  module AsyncExport
    module ResourceControllerExtension
      def self.included(base)
        super
        base.send :alias_method_chain, :index, :email
        base.send :respond_to, :email
      end

      def index_with_email(&block)
        index_without_email do |format|
          format.email do
            current_user_method = active_admin_config.namespace.application.current_user_method
            admin_email = send(current_user_method).email
            ActiveAdmin::AsyncExport::AsyncExportMailer.delay.csv_export(admin_email, collection.first.class.to_s, params.to_json)
            redirect_to :back, notice: "CSV export emailed to #{admin_email}!"
          end
        end
      end
    end
  end
end
