require 'spec_helper'

describe "invites/show" do
  before(:each) do
    @invite = assign(:invite, stub_model(Invite,
      :user_id => 1,
      :project_id => 1,
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role/)
  end
end
