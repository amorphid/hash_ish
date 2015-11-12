require 'spec_helper'
require 'pry'

describe HashIsh::AddInstanceMethods do
  let(:adder) { HashIsh::AddInstanceMethods.new }
  let(:klass) { Class.new }

  context '#add' do
    it 'with empty hash' do
      expect { adder.add(klass, {}) }.
        to change { klass.new.methods.length }.
        by(0)
    end

    it 'with 1 pair' do
      expect { adder.add(klass, { a: 1 }) }.
        to change { klass.new.methods.length }.
        by(1)
    end

    it 'with 2 pairs' do
      expect { adder.add(klass, { a: 1, b: 2 }) }.
        to change { klass.new.methods.length }.
        by(2)
    end
  end

  context '#hash_ish' do
    it 'with 1 pair hash' do
      expect(adder.hash_ish({a: 1})).
        to respond_to(:a)
    end
  end
end
