module ActiveAdmin
  module AsyncExport
    class AsyncExportMailer < ActionMailer::Base
      add_template_helper MethodOrProcHelper

      def csv_export(admin_email, model_name)
        controller = Kernel::qualified_const_get("Admins::#{model_name}sController").new
        config = controller.send(:active_admin_config)
        path = controller.send(:active_admin_template, 'index.csv')
        csv_filename = controller.send(:csv_filename)
        collection = controller.send(:scoped_collection)
        app = ActiveAdmin.application

        csv = render_to_string(file: path,
                         layout: false,
                         locals: {
                           active_admin_application: app,
                           active_admin_config: config,
                           collection: collection,
                          })

        attachments[csv_filename] = csv
        mail(to: admin_email,
             subject: csv_filename,
             body: 'See attached',
             from: ActiveAdmin::AsyncExport.from_email_address)
      end
    end
  end
end
