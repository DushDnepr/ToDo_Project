require "spec_helper"

describe Project do

  it { should belong_to(:user) }
  it { should have_many(:listtasks).dependent(:destroy)}

  it "should be saved with valid data" do
    lambda{
      Project.create(:name => "Project 1", :description => "Descr", :user_id => 1)
    }.should change{Project.count}.by 1
  end
end