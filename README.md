# ActiveadminAsyncExport

ActiveAdmin plugin for email delivery of CSV exports.

Uses resque_mailer to asynchronously run slow data exports and deliver the results via email.

## Installation

Add this line to your application's Gemfile:

    gem 'activeadmin_async_export'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeadmin_async_export

## Usage

Just add `gem 'activeadmin_async_export'` to your Gemfile. All of the active admin resource index pages will now include a link export data via email. This link will run the CSV report and email the results as an attachement to the current admin user.

### Set the from email address

In an initializer, include a line like the following:

    ActiveAdmin::AsyncExport.from_email_address = 'admin@topshelfclothes.com'

### Change the active admin namespace

If your namespace of active-admin is not Admin you can change it.

    ActiveAdmin::AsyncExport.controller_namespace = 'Myadmin'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
