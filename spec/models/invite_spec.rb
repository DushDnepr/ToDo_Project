require 'spec_helper'

describe Invite do
  it {should belong_to(:project)}
  it {should belong_to(:user)}
end
