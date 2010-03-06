require "test_helper"

class <%= controller_class_name %>IntegrationTest < ActionController::IntegrationTest
  def setup
    @<%= name %> = <%= class_name %>.first
    login_as :admin
  end
  
  test "admin should get index" do
    visit "/<%= table_name %>"
    assert_template "<%= table_name %>/index"
  end

  test "admin should create new <%= name %>" do
    visit "/<%= table_name %>/new"

    assert_template "<%= table_name %>/new"
    fill_in :<%= name %>_name, :with => "test name"
    click_button :<%= name %>_submit

    assert_template "<%= table_name %>/show"
  end

  test "admin should get show" do
    visit "/<%= table_name %>/#{@<%= name %>.id}"
    assert_template "<%= table_name %>/show"
  end

  test "admin should update <%= name %>" do
    visit "/<%= table_name %>/#{@<%= name %>.id}/edit"

    assert_template "<%= table_name %>/edit"
    fill_in :<%= name %>_name, :with => "edited name"
    click_button :<%= name %>_submit

    assert_template "<%= table_name %>/show"
  end
end
