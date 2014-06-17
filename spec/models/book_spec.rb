require 'spec_helper'

describe Book do
  before { subject = FactoryGirl.create(:book) }

  specify { expect{ subject.add_rating(4) }.to change(subject, :total_rating_count).by(1) }

  specify { expect{ subject.add_rating(4) }.to change(subject, :total_rating_value).by(4) }

end
