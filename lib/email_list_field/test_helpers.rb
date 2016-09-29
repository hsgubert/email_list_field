# Defines helpers to be used in feature/integration tests in the target app.
# These helpers work for a RSpec + Capybara + PhantomJS test suite (javascript
# must be enabled)
#
# To include these helpers add to your spec/spec_helper.rb or to you spec/rails_helper.rb:
#
#   RSpec.configure do |config|
#     config.include EmailListField::TestHelpers, type: :feature
#   end
#
module EmailListField::TestHelpers

  def fill_in_email_list_field(wrapper_id, options={})
    with = options.delete(:with)
    fill_options = options.delete(:fill_options)
    find('#' + wrapper_id + ' input.taggle_input').set(with, fill_options)
  end

  def remove_from_email_list_field(wrapper_id, formatted_email)
    find('#' + wrapper_id + ' li', text: formatted_email).find('button', visible: false).trigger('click')
  end

end
