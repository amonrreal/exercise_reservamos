class CodeFormatValidator < ActiveModel::EachValidator
  CODE_FORMAT = /\A[[:alpha:]]{2}+_[\d]{2}\z/

  def validate_each(record, attribute, value)
    if !value.match?(CODE_FORMAT)
      record.errors.add(attribute, "Formato invalido")
    end
  end
end