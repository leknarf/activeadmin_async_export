module ActiveAdmin
  module AsyncExport
    class AsyncExportMailer < ActionMailer::Base
      def csv_export(admin_email, model_name)
        controller = Kernel::qualified_const_get("Admin::#{model_name}sController").new
        config = controller.send(:active_admin_config)
        csv_filename = controller.send(:csv_filename)
        def controller.find_collection(options = {})
          options[:only] = [:includes, :collection_decorator]
          collection = scoped_collection
          collection_applies(options).each do |applyer|
            collection = send("apply_#{applyer}", collection)
          end
          collection
        end

        csv = StringIO.new.tap{|io| config.csv_builder.build(controller, io)}.string

        attachments[csv_filename] = csv
        mail(to: admin_email,
             subject: csv_filename,
             body: 'See attached',
             from: ActiveAdmin::AsyncExport.from_email_address)
      end
    end
  end
end
