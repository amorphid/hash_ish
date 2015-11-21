require 'spec_helper'

describe HashIsh::OverrideFalseyDataUsingSchema do
  subject { described_class }

  def override(hash, defaults)
    subject.override(hash, defaults)
  end

  context '#add_defaults' do
    it 'override if empty hash' do
      expect(override(
        {},
        {a: 1}
      )).to eq({a: 1})
    end

    it 'override if nil' do
      expect(override(
        {a: nil},
        {a: 1}
      )).to eq({a: 1})
    end

    it 'override if false' do
      expect(override(
        {a: false},
        {a: 1}
      )).to eq({a: 1})
    end

    it 'does not override if 0' do
      expect(override(
        {a: 0},
        {a: 1}
      )).to eq({a: 0})
    end

    it 'does not override if empty string' do
      expect(override(
        {a: ''},
        {a: 1}
      )).to eq({a: ''})
    end

    it 'does not override if true' do
      expect(override(
        {a: true},
        {a: 1}
      )).to eq({a: true})
    end

    it 'override if nested empty hash' do
      expect(override(
        { a: {} },
        { a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'override if nested empty nil' do
      expect(override(
        {a: {b: nil} },
        {a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'override if nested false' do
      expect(override(
        {a: {b: false} },
        {a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'does not override if nested 0' do
      expect(override(
        { a: {b: 0} },
        { a: {b: 1} }
      )).to eq({a: {b: 0} })
    end

    it 'does not override if nested empty string' do
      expect(override(
        {a: {b: ''} },
        {a: {b: 1} }
      )).to eq({a: {b: ''} })
    end

    it 'does not override
     if nested true' do
      expect(override(
        {a: {b: true} },
        {a: {b: 1} }
      )).to eq({a: {b: true} })
    end
  end
end
