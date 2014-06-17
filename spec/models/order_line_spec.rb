require 'spec_helper'

describe OrderLine do
  let(:book) { FactoryGirl.create(:book) }
  before do
    subject.stub(:book) { book }
    subject.stub(:quantity) { 2 }
  end

  specify { expect(subject.total_price).to eq 2 * book[:unit_price] }
end
