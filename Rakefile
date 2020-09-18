task :default => %w[test]

desc "Check lib/autorubyconf.rb"
task :test do
  system("ruby -c -d -w -v lib/autorubyconf.rb")
end
