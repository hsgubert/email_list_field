require 'spec_helper'

describe EmailListField do
  it 'has a version number' do
    expect(EmailListField::VERSION).not_to be nil
  end

  it 'has a rails engine defined' do
    expect(EmailListField::Engine.superclass).to be Rails::Engine
  end

  describe '.parse_email_list_params' do
    before do
      @params = {}
      @params[:emails] = [
        'Name <email1@address.com>',
        'email2@address.com.br',
        'Compound Name <EMAIL3@Address.com.de>'
      ]
    end

    it 'should return empty array if there are no emails params' do
      expect(EmailListField.parse_email_list_params(nil)).to be_empty
      expect(EmailListField.parse_email_list_params([])).to be_empty
    end

    it 'should split emails in pairs of name and email address, lowering case of email by default' do
      expect(EmailListField.parse_email_list_params(@params[:emails])).to be == [
        ['Name', 'email1@address.com'],
        [nil, 'email2@address.com.br'],
        ['Compound Name', 'email3@address.com.de']
      ]
    end

    it 'should not lower email case if option is passed' do
      expect(EmailListField.parse_email_list_params(@params[:emails], lower_email_address_case: false)).to be == [
        ['Name', 'email1@address.com'],
        [nil, 'email2@address.com.br'],
        ['Compound Name', 'EMAIL3@Address.com.de']
      ]
    end
  end
end
