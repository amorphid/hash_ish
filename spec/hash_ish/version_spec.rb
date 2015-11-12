require 'spec_helper'

describe HashIsh do
  let(:version) { HashIsh::VERSION }

  it 'has a pattern' do
    expect(version).to match(/\d+\.\d+\.\d+/)
  end
end
