require 'spec_helper'

describe HashIsh::AddDefaultValues do
  let(:adder) { described_class.new }

  context '#add_defaults' do
    it 'modifies falsey default' do
      expect(adder.add({}, {a: 1})).
        to eq({a: 1})
      expect(adder.add({a: nil}, {a: 1})).
        to eq({a: 1})
      expect(adder.add({a: false}, {a: 1})).
        to eq({a: 1})
    end

    it 'does not modify truthy default' do
      expect(adder.add({a: 0}, {a: 1})).
        to eq({a: 0})
      expect(adder.add({a: ''}, {a: 1})).
        to eq({a: ''})
      expect(adder.add({a: true}, {a: 1})).
        to eq({a: true})
    end

    it 'modifies nested falsey nested default' do
      expect(adder.add(
        { a: {} },
        { a: {b: 1} }
      )).to eq({a: {b: 1} })
      expect(adder.add(
        {a: {b: nil} },
        {a: {b: 1} }
      )).to eq({a: {b: 1} })
      expect(adder.add(
        {a: {b: false} },
        {a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'does not modify nested truthy nested default' do
      expect(adder.add(
        { a: {b: 0} },
        { a: {b: 1} }
      )).to eq({a: {b: 0} })
      expect(adder.add(
        {a: {b: ''} },
        {a: {b: 1} }
      )).to eq({a: {b: ''} })
      expect(adder.add(
        {a: {b: true} },
        {a: {b: 1} }
      )).to eq({a: {b: true} })
    end
  end

  context '#is_a_hash?' do
    it 'is true' do
      expect(adder.is_a_hash?({})).
        to eq(true)
    end
  end

  context '#truthy?' do
    it 'is true' do
      expect(adder.truthy?({ a: 0 },     :a)).to eq(true)
      expect(adder.truthy?({ a: '' },    :a)).to eq(true)
      expect(adder.truthy?({ a: true },  :a)).to eq(true)
    end

    it 'is false' do
      expect(adder.truthy?({},           :a)).to eq(false)
      expect(adder.truthy?({ a: nil },   :a)).to eq(false)
      expect(adder.truthy?({ a: false }, :a)).to eq(false)
    end
  end
end
