# spec/models/rate_spec.rb

require 'rails_helper'

RSpec.describe Rate, type: :model do

  describe 'attributes' do
    it { should respond_to(:stars) }
    it { should respond_to(:dimension) }
    it { should respond_to(:reviews) }
  end
end
