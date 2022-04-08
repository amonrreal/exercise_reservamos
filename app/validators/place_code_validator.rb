class PlaceCodeValidator < ActiveModel::EachValidator
  CODE_FORMAT = /\A[[:alpha:]]{2}+_[\d]{2}\z/

  def validate_each(record, attribute, value)
    if !record.code.match?(CODE_FORMAT)
      record.errors.add(
        attribute,
        :blank, 
        message: "Formato invalido"
      )
    end
  end
end