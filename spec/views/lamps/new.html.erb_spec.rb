require 'rails_helper'

RSpec.describe "lamps/new", type: :view do
  before(:each) do
    assign(:lamp, Lamp.new(
      :name => "MyString",
      :description => "MyText",
      :calendar => "MyString",
      :status => 1
    ))
  end

  it "renders new lamp form" do
    render

    assert_select "form[action=?][method=?]", lamps_path, "post" do

      assert_select "input#lamp_name[name=?]", "lamp[name]"

      assert_select "textarea#lamp_description[name=?]", "lamp[description]"

      assert_select "input#lamp_calendar[name=?]", "lamp[calendar]"

      assert_select "input#lamp_status[name=?]", "lamp[status]"
    end
  end
end
