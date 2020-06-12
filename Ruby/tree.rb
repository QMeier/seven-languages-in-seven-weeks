#!/usr/bin/env ruby
class Tree
  attr_accessor :children, :node_name

  def initialize(name, val = {})
    @children = []
    @node_name = name
    if(val.is_a?(Hash))
      val.keys.each do |key|
        children.push Tree.new(key, val[key])
      end

  def visit_all(&block)
    vist &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

begin
  ruby_tree = Tree.new( "Ruby", [Tree.new("Reia"), Tree.new("MacRuby")] )

  puts "Visiting a node"
  ruby_tree.visit {|node| puts node.node_name}
  puts

  puts "visiting entire tree"
  ruby_tree.visit_all {|node| puts node.node_name}9
end
