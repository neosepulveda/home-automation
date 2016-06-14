require 'rails_helper'

RSpec.describe "scripts/new", type: :view do
  before(:each) do
    assign(:script, Script.new(
      :name => "MyString",
      :code => "MyText",
      :lamp => nil
    ))
  end

  it "renders new script form" do
    render

    assert_select "form[action=?][method=?]", scripts_path, "post" do

      assert_select "input#script_name[name=?]", "script[name]"

      assert_select "textarea#script_code[name=?]", "script[code]"

      assert_select "input#script_lamp_id[name=?]", "script[lamp_id]"
    end
  end
end
