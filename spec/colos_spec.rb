require 'spec_helper'
require 'colos/version'

describe Colos do

  describe "VERSION" do
    subject { Colos::VERSION }
    it { should be_a String }
  end

  describe "#color" do
    it "generates from `test`" do
      Colos.color("test").should == "924436"
    end

    it "generates from `greenish`" do
      Colos.color("greenish").should == "9bc63b"
    end
  end
end
