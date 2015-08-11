require 'spec_helper'

describe 'after_commit_helper' do
  before(:each) do
    $called = nil
  end

  after(:each) do
    $called = nil
  end

  it 'should leave called false' do
    test = Test.new value: 1

    expect($called).to eq nil

    test.save!

    expect($called).to eq nil
  end

  it 'should set called to true' do
    test = Test.new value: 2

    expect($called).to eq nil

    test.add_after_commit_callback do
      test.called
    end

    expect($called).to eq nil

    test.save!

    expect($called).to eq true
  end

  it 'should set called to true only after transaction commits' do
    Test.transaction do
      test = Test.new value: 3

      expect($called).to eq nil

      test.add_after_commit_callback do
        test.called
      end

      expect($called).to eq nil

      test.save!

      expect($called).to eq nil
    end

    # Now it should be set since transaction is committed
    expect($called).to eq true
  end
end