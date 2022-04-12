require "test_helper"

class FormUserTest < ActiveSupport::TestCase
  setup do
    @form_user = FormUser.new(
      name: "User",
      email: "user@example.com"
    )
  end

  test "form should be valid" do
    assert @form_user.valid?, "Test failed"
  end

  test "form should be invalid" do
    @form_user.name = ""
    assert_not @form_user.valid?, "Test failed"
  end

  test "name can not be blank" do
    @form_user.name = ""
    assert_not @form_user.valid?, "Test failed"
    errors = @form_user.errors.full_messages
    assert errors.any?, "Test failed"
    errors = errors.include? "Name can't be blank"
    assert errors, "Test failed"
  end

  test "email can not be blank" do
    @form_user.email = ""
    assert_not @form_user.valid?, "Test failed"
    errors = @form_user.errors.full_messages
    assert errors.any?, "Test failed"
    errors = errors.include? "Email can't be blank"
    assert errors, "Test failed"
  end

  test "invalid email" do
    @form_user.email = "aaaa.com"
    assert_not @form_user.valid?, "Test failed"
    errors = @form_user.errors.full_messages
    assert errors.any?, "Test failed"
    errors = errors.include? "Email Invalid"
    assert errors, "Test failed"
  end
end