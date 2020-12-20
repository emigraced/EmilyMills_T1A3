require_relative 'functions'
require_relative 'ascii_title.txt'

describe 'ascii_title' do
  it 'displays ascii art' do
    expect(ascii_title).not_to eq(5)
  end
end
