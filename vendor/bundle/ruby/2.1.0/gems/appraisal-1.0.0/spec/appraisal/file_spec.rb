require 'spec_helper'
require 'appraisal/file'

# Requiring this to make the test pass on Rubinius 2.2.5
# https://github.com/rubinius/rubinius/issues/2934
require 'rspec/matchers/built_in/raise_error'

describe Appraisal::File do
  it "should complain when no Appraisals file is found" do
    ::File.stub(:exist?).with("Appraisals").and_return(false)
    expect { described_class.new }.to raise_error(Appraisal::AppraisalsNotFound)
  end
end
