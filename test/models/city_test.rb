require "test_helper"

class CityTest < ActiveSupport::TestCase
  setup do
    state = State.new(
      name: 'state',
      code: 'aa_11'
    )
    state.save
    @city = City.new(
      name: "test",
      code: "aa_11",
      state: state
    )
    @city.save
  end

  test "city should be valid" do
    assert @city.valid?, "Test failed"
  end

  test "city should be invalid" do
    @city.update(state: nil)
    assert_not @city.valid?, "Test failed"
  end

  test "name can not be blank" do
    @city.update(name: "")
    assert @city.errors[:name].present?, "Test failed"
  end

  test "code is unique" do
    @city_2 = City.new(name: "test2", code: "aa_22")
    @city_2.save
    code_unique = @city_2.errors[:code].include? "has already been taken"
    assert_not code_unique, "Test failed"
  end

  test "code is not unique" do
    @city_2 = City.new(@city.attributes)
    @city_2.save
    code_unique = @city_2.errors[:code].include? "has already been taken"
    assert code_unique, "Test failed"
  end

  test "code can not be blank" do
    @city.update(code: "")
    code_blank = @city.errors[:code].include? "can't be blank"
    assert code_blank, "Test failed"
  end

  test "code has invalid format" do
    @city.update(code: "aaa_11")
    code_invalid = @city.errors[:code].include? "Invalid format"
    assert code_invalid, "Test failed"
  end

  test "city code has not a letter m" do
    assert_not_equal true, @city.has_m?, "Test failed"
  end

  test "city code has a letter m" do
    @city.update(code: "ma_11")
    assert_equal true, @city.has_m?, "Test failed"
  end
end