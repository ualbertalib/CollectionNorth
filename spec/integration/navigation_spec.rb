require 'rails_helper'

RSpec.describe 'Navigation' do
  it 'is a valid app' do
    expect(::Rails.application).to be_a(Dummy::Application)
  end
end
