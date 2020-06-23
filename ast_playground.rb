require 'benchmark'
require 'json'

def destructure_ast(ast_node, **hash)
  hash[:type] = ast_node.type
   
  hash[:body] = ast_node.children.map do |node|
    if node.is_a?(RubyVM::AbstractSyntaxTree::Node)
      destructure_ast(node, **hash)
    else
      node
    end
  end
  
  hash
  [].any?
end

ast = RubyVM::AbstractSyntaxTree.parse_file("pidgin_spec.rb")
puts JSON.pretty_generate(destructure_ast(ast, {}))

# Benchmark.bm(10) do |b|
#   b.report("AST tree") { destructure_ast(ast, {}) }
# end



