require "test_helper"

class StateTest < ActiveSupport::TestCase
  setup do
    @state = State.new(
      name: "test",
      code: "aa_11"
    )
    @state.save
  end

  test "state should be valid" do
    assert @state.valid?, "Test failed"
  end

  test "state should be invalid" do
    @state.update(code: "aaaaa")
    assert_not @state.valid?, "Test failed"
  end

  test "name can not be blank" do
    @state.update(name: "")
    assert @state.errors[:name].present?, "Test failed"
  end

  test "code is unique" do
    @state_2 = State.new(name: "test2", code: "aa_22")
    @state_2.save
    code_unique = @state_2.errors[:code].include? "has already been taken"
    assert_not code_unique, "Test failed"
  end

  test "code is not unique" do
    @state_2 = State.new(@state.attributes)
    @state_2.save
    code_unique = @state_2.errors[:code].include? "has already been taken"
    assert code_unique, "Test failed"
  end

  test "code can not be blank" do
    @state.update(code: "")
    code_blank = @state.errors[:code].include? "can't be blank"
    assert code_blank, "Test failed"
  end

  test "code has invalid format" do
    @state.update(code: "aaa_11")
    code_invalid = @state.errors[:code].include? "Invalid format"
    assert code_invalid, "Test failed"
  end

  test "state code has not a letter m" do
    assert_not_equal true, @state.has_m?, "Test failed"
  end

  test "state code has a letter m" do
    @state.update(code: "ma_11")
    assert_equal true, @state.has_m?, "Test failed"
  end
end
