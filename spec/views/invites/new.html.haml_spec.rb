require 'spec_helper'

describe "invites/new" do
  before(:each) do
    assign(:invite, stub_model(Invite,
      :user_id => 1,
      :project_id => 1,
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new invite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invites_path, :method => "post" do
      assert_select "input#invite_user_id", :name => "invite[user_id]"
      assert_select "input#invite_project_id", :name => "invite[project_id]"
      assert_select "input#invite_role", :name => "invite[role]"
    end
  end
end
