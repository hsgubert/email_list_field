# EmailListField

Creates editable form field for email lists using jquery and jquery-ui.

This gem is a wrapper of the [jquery-email_list_field.js](https://github.com/hsgubert/jquery-email_list_field) project, that allows you to include jquery-email_list_field.js in your Rails app, using the asset pipeline. The gem currently includes v1.1.0 of jquery-email_list_field.js.

![](https://github.com/hsgubert/email_list_field/raw/master/preview.gif)
```html
<div id="mailing_list_container"></div>
<script>
  $('#mailing_list_container').emailListField();
</script>
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_list_field'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_list_field

## Usage

Include the jquery-email_list_field.js javascript in your `app/assets/javascripts/application.js` or `app/assets/javascripts/vendor.js`:
```
//= require email_list_field
```
And include stylesheets in your `app/assets/stylesheets/application.js` or `app/assets/stylesheets/vendor.js`::
```
*= require email_list_field
```

In your view, create an empty div and call the `emailListField()` JQuery method:
```html
<div id="mailing_list_container"></div>
<script>
  $('#mailing_list_container').emailListField();
</script>
```

For a full reference on all the options available, see the [jquery-email_list_field.js page](https://github.com/hsgubert/jquery-email_list_field)

## Params Handling Method
When the user submits the form containing the email list field, an array of strings will be submitted to your controller (by default at `params[:emails]`). The problem is that these string might be either an email or a string in the format "Name <email>". There is a helper to help you treat these parameters:
```ruby
params[:emails] = [
  'Name <email1@address.com>',
  'email2@address.com.br',
  'Compound Name <EMAIL3@Address.com.de>'
]

EmailListField.parse_email_list_params(params[:emails])
# =>  [
#   ['Name', 'email1@address.com'],
#   [nil, 'email2@address.com.br'],
#   ['Compound Name', 'email3@address.com.de']
# ]
```

This helper will identify the name and the email part of the string. It will also downcase all the emails. If you don't want the emails to be downcased you can pass the `lower_email_address_case: false` option as a second parameter.

## Feature/Integration Tests
For you to be able to test the email list field behavior, you will need an integration test with javascripts enabled. We recommend the RSpec + Capybara + PhantomJS tools. To make those tests easier, the gem packages helpers to be used during testing.

To include these helpers add to your `spec/spec_helper.rb` or to you `spec/rails_helper.rb`:
```ruby
RSpec.configure do |config|
  config.include EmailListField::TestHelpers, type: :feature
end
```

Then you can use these helpers:
```ruby
fill_in_email_list_field 'mailing_list_container', with: 'some@email.com'
remove_from_email_list_field 'mailing_list_container', 'some@email.com'
```
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
