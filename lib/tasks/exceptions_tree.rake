# exceptions_tree gem
desc "Describe the configured exceptions heirarchy"
task :exceptions do
  ExceptionsTree::display_exceptions
end
