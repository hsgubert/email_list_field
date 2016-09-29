module EmailListField::StaticHelpers
  EMAIL_EXTRACTION_REGEXP = /^([^<>]*)<(.+)>$/

  # Inputs
  # => emails: an array of strings, where each string may be either an email or a "Name <email>" string
  # => options:
  #     :lower_email_address_case [true|false] default=true
  #
  # Output:
  # => an array of pairs [name, email], where name might be nil
  #
  def parse_email_list_params(emails, options={})
    return [] unless emails

    lower_email_address_case = (!options[:lower_email_address_case].nil? ? options[:lower_email_address_case] : true)

    emails.map do |formatted_email|
      stripped_formatted_email = formatted_email.strip

      if matchdata = stripped_formatted_email.match(EmailListField::StaticHelpers::EMAIL_EXTRACTION_REGEXP)
        parsed_email = [matchdata[1].strip, matchdata[2].strip]
      else
        parsed_email = [nil, stripped_formatted_email]
      end

      if lower_email_address_case
        parsed_email[1].downcase!
      end

      parsed_email
    end
  end

end
