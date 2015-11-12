require 'spec_helper'

describe HashIsh do
  context '#self.hash_sub_class' do
    let(:klass) { HashIsh.hash_sub_class }

    it 'inherits from Hash' do
      expect(klass.ancestors).to include(Hash)
    end

    it 'is not a Hash' do
      expect(klass).not_to be_a(Hash)
    end
  end
end
