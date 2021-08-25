require 'rails_helper'

RSpec.describe Player do
  it {should belong_to :team}
end
