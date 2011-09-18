desc 'runs the tests'
task 'test' do
  $LOAD_PATH.unshift File.dirname(__FILE__) + "/lib"
  $LOAD_PATH.unshift File.dirname(__FILE__) + "/test"
  require 'test/unit'
  
  require 'parsing_test'
  require 'parser_tree_test'
  require 'parser_to_s_test'
end
