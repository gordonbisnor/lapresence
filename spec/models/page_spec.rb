require 'spec_helper'

describe Page do
  it { is_expected.to validate_uniqueness_of :slug }
  it { is_expected.to validate_presence_of :slug }
end
