require "spec_helper"

describe Listtask do

  it { should belong_to(:project)}
  it { should have_many(:tasks).dependent(:destroy)}
end