# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin_async_export/version'

Gem::Specification.new do |gem|
  gem.name          = "activeadmin_async_export"
  gem.version       = ActiveAdminAsyncExport::VERSION
  gem.authors       = ["Andrew Frankel"]
  gem.email         = ["andrew@leknarf.net"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'activeadmin', '>=0.5.1'
  gem.add_runtime_dependency 'resque_mailer'
end
