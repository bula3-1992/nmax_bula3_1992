RSpec.describe NmaxBula31992 do
  it 'has a version number' do
    expect(NmaxBula31992::VERSION).not_to be nil
  end

  it 'checks Node init' do
    node = NmaxBula31992::Node.new(%w[0 1 2])
    expect(node.value).to eq(%w[0 1 2])
    expect(node.left).to eq(nil)
    expect(node.right).to eq(nil)
  end

  it 'checks pushNode bigger' do
    node = NmaxBula31992::Node.new(%w[0 1 2])
    NmaxBula31992.pushNode(node, %w[0 1 3])
    expect(node.left.value).to eq(%w[0 1 3])
  end

  it 'checks pushNode smaller' do
    node = NmaxBula31992::Node.new(%w[0 1 2])
    NmaxBula31992.pushNode(node, %w[0 1 1])
    expect(node.right.value).to eq(%w[0 1 1])
  end

  it 'checks pushNode equal' do
    node = NmaxBula31992::Node.new(%w[0 1 2])
    NmaxBula31992.pushNode(node, %w[0 1 2])
    expect(node.right.value).to eq(%w[0 1 2])
  end

  it 'checks compare equal' do
    result = NmaxBula31992.compare(%w[0 1 2], %w[0 1 2])
    expect(result).to eq(0)
  end

  it 'checks compare bigger' do
    result = NmaxBula31992.compare(%w[0 1 3], %w[0 1 2])
    expect(result).to eq(1)
  end

  it 'checks compare smaller' do
    result = NmaxBula31992.compare(%w[0 1 1], %w[0 1 2])
    expect(result).to eq(-1)
  end

  it 'checks traverse' do
    root = NmaxBula31992::Node.new(%w[0 1 2])
    NmaxBula31992.pushNode(root, %w[0 1 1])
    NmaxBula31992.pushNode(root, %w[0 1 3])
    NmaxBula31992.set_counter
    expected_result = '013
012
011
'
    expect do
      NmaxBula31992.traverse(root)
    end.to output(expected_result).to_stdout
  end

  it 'checks traverse with n' do
    root = NmaxBula31992::Node.new(%w[0 1 2])
    NmaxBula31992.pushNode(root, %w[0 1 1])
    NmaxBula31992.pushNode(root, %w[0 1 3])
    NmaxBula31992.set_counter
    NmaxBula31992.set_n 1
    expected_result = '013
'
    expect do
      NmaxBula31992.traverse(root)
    end.to output(expected_result).to_stdout
  end
end
