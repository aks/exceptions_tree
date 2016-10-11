module ExceptionsTree

  class <<self

    CLASSES_TO_IGNORE = [ Object, Kernel, BasicObject ]

    def display_exceptions
      puts inspect_exceptions_tree(build_exceptions_tree, 0)
    end

    def build_exceptions_tree
      exception_classes = []
      exceptions_tree = {}
      ObjectSpace.each_object(Class) do |klass|
        next unless klass.ancestors.include?(Exception)
        next if exception_classes.include?(klass)
        next if klass.superclass == SystemCallError # don't want ERRNO
        next if CLASSES_TO_IGNORE.include?(klass)
        exception_classes << klass
        klass.ancestors.delete_if {|e| CLASSES_TO_IGNORE.include?(e)}.
            reverse.inject(exceptions_tree) {|memo,klass2| memo[klass2] ||= {}}
      end
      exceptions_tree
    end

    def inspect_exceptions_tree(tree, level)
      output = ''
      tree.keys.sort {|k1, k2| k1.name <=> k2.name}.each do |class_name|
        output += sprintf("%s%s\n", ('  ' * level), class_name)
        output += inspect_exceptions_tree(tree[class_name], level+1)
      end
      output
    end
  end

end
