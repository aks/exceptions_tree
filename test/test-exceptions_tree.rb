require 'minitest/autorun'
require 'exceptions_tree'

class TestExceptionsTree < Minitest::Test

  STANDARD_EXCEPTIONS = [ ::RuntimeError, ::StandardError, ::IOError, ::IndexError,
                          ::RegexpError, ::RangeError, ::TypeError, ::SystemCallError ]

  def test_exceptions_tree_class_methods
    assert_respond_to ExceptionsTree, :build_exceptions_tree
    assert_respond_to ExceptionsTree, :inspect_exceptions_tree
    assert_respond_to ExceptionsTree, :display_exceptions
  end

  def test_build_exceptions_tree
    tree = ExceptionsTree.build_exceptions_tree
    assert_kind_of Hash, tree
    STANDARD_EXCEPTIONS.each do |exception_class|
      assert is_a_deep_key?(tree, exception_class)
    end
  end

  def test_inspect_exceptions_tree
    tree = ExceptionsTree.build_exceptions_tree
    output = ExceptionsTree.inspect_exceptions_tree(tree, 0)
    STANDARD_EXCEPTIONS.each do |exception_class|
      assert_includes output, ' ' + exception_class.to_s + "\n"
    end
  end

  def test_display_exceptions
    tree = ExceptionsTree.build_exceptions_tree
    output = ExceptionsTree.inspect_exceptions_tree(tree, 0)
    assert_output(output) { ExceptionsTree.display_exceptions }
  end

  private

    def is_a_deep_key?(tree, key)
      tree.key?(key) || is_a_subkey?(tree, key)
    end

    def is_a_subkey?(tree, key)
      tree.select{|k,v| v.respond_to?(:key?)}.each do |k,v|
        return true if is_a_deep_key?(v, key)
      end
      false
    end

end

