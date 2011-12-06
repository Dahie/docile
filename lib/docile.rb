require "docile/version"

module Docile
  # Executes a block in the context of an object whose interface represents a DSL.
  #
  #   Docile.dsl_eval([]) do
  #     push 1
  #     push 2
  #     pop
  #     push 3
  #   end
  #   #=> [1, 3]
  #
  # @param dsl [Object]  an object whose methods represent a DSL
  # @param block [Proc]  a block to execute in the DSL context
  # @return [Object]     the given DSL object
  def dsl_eval(dsl, &block)
    block_context = eval("self", block.binding)
    dsl.instance_eval(&block)
    dsl
  end
  module_function :dsl_eval
end