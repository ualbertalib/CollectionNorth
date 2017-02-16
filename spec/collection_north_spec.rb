require 'spec_helper'

describe CollectionNorth do
  it 'is valid' do
    expect(CollectionNorth).to be_a(Module)
  end

  it 'is loadable without preloading rails' do
    expect { require 'collection_north' }.not_to raise_error
  end
end
