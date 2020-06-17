#!/usr/bin/env ruby
class Tree
  attr_accessor :children, :node_name

  def initialize(name, data = {})
    @children = []
    @node_name = name
    if(data.is_a?(Hash))
      data.keys.each do |key|
        children.push Tree.new(key, data[key])
      end
    elsif(data)
      children.push(Tree.new(data,nil))
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end


  ruby_tree = Tree.new( "Ruby", {
    "rubi":"ruby",
    "wasser":"water"
    })

  puts "Visiting a node"
  ruby_tree.visit {|node| puts node.node_name}
  puts

  puts "Visiting the entire tree"
  ruby_tree.visit_all {|node| puts node.node_name}
