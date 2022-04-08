class EmailValidator < ActiveModel::EachValidator
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def validate_each(record, attribute, value)
    if !record.email.match?(VALID_EMAIL)
      record.errors.add(
        attribute,
        :blank, 
        message: "Formato de correo invalido"
      )
    end
  end
end