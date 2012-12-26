module ActiveAdmin
  module AsyncExport
    module BuildDownloadFormatLinks
      def self.included(base)
        base.send :alias_method_chain, :build_download_format_links, :email
      end
    end
  end
end
