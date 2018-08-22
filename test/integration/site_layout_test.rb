require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "logo link" do
    get root_path
    assert_template 'layouts/application'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", login_path
  end
end
