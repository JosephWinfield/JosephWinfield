require 'rails_helper'

describe Post do
  it "should have a title attribute" do
    should have_valid(:title).when('A blog about something')
  end

  it "should not be left blank" do
    should_not have_valid(:title).when(nil, '')
  end

  it "should have a Body" do
    should have_valid(:body).when('blah blah blah')
  end

  it "should not be left blank" do
    should_not have_valid(:body).when(nil, '')
  end
end
