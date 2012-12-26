# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_admin/async_export/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "activeadmin_async_export"
  gem.version       = ActiveAdmin::AsyncExport::VERSION
  gem.authors       = ["Andrew Frankel"]
  gem.email         = ["andrew@leknarf.net"]
  gem.description   = %q{ActiveAdmin plugin for email delivery of CSV exports.}
  gem.summary       = %q{Uses resque_mailer to asynchronously run slow data exports and deliver the results via email.}
  gem.homepage      = "https://github.com/leknarf/activeadmin_async_export"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_path = 'lib'
  gem.required_ruby_version = '>= 1.9.2'

  gem.add_runtime_dependency 'activeadmin', '>= 0.5.1'
  gem.add_runtime_dependency 'resque_mailer'
end
