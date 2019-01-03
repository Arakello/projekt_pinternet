require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { is_expected.to validate_presence_of(:image) }
end
