require 'spec_helper'

describe "A RubyDay 2013 speaker" do
  let(:speaker) { Speaker.new(:name=>"Jonh Doe", :github=>"johnny", :twitter=>"johnny", :url=>"http://www.johnny.com") }
  it "must be valid if created with sane parameters" do
    speaker.valid?.should   be_true
  end

  it "will have github link to be created for free" do
    speaker.github.should   == "https://github.com/johnny"
  end
end
