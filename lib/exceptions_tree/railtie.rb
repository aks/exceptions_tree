require 'exceptions_tree'
require 'rails'

module ExceptionsTree
  class Railtie < Rails::Railtie
    railtie_name :exceptions_tree

    rake_tasks do
      load "tasks/exceptions_tree.rake"
    end
  end
end
