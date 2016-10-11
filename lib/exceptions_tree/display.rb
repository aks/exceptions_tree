module ExceptionsTree

  class <<self
    def display_exceptions
      exception_classes = []
      exception_tree = {}
      ObjectSpace.each_object(Class) do |klass|
        next unless klass.ancestors.include? Exception
        next if exception_classes.include? klass
        next if klass.superclass == SystemCallError # don't want ERRNO
        exception_classes << klass
        klass.ancestors.delete_if {|e| [Object, Kernel].include? e }.
            reverse.inject(exception_tree) {|memo,klass2| memo[klass2] ||= {}}
      end
      show_exception_tree(exception_tree, 0)
    end

    def show_exception_tree(tree, level)
      tree.keys.sort {|k1, k2| k1.name <=> k2.name}.each do |class_name|
        printf "%s%s\n", ('  ' * level), class_name
        show_exception_tree(tree[class_name], level+1)
      end
    end
  end

end
