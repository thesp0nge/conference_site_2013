require 'spec_helper'

describe "A RubyDay 2013 speaker" do
  let(:speaker) { Speaker.new(:name=>"Jonh Doe", :github=>"johnny", :twitter=>"johnny", :url=>"http://www.johnny.com") }
  it "must be valid if created with sane parameters" do
    speaker.valid?.should   be_true
  end

  context "will have a github link" do

    it "created for free" do
      speaker.github.should   == "https://github.com/johnny"
    end

    it "saved as is if filled with the whole github link" do
      speaker.github="https://github.com/thesp0nge"
      speaker.github.should   == "https://github.com/thesp0nge"
    end

    it "discarded if if filled with rubbish" do
      speaker.github="http://www.google.com"
      speaker.github.should   == ""
    end
  end
end
