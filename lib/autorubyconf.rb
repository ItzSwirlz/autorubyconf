#!/usr/bin/ruby

def find_modules(module_names, main_module_file_paths)
  for themodule in module_names
    themodule.to_s
    for themodulepath in main_module_file_paths
      themodulepath.to_s

      print("Checking for " + themodule + "... ")
      full_module_path = "/var/lib/gems/" + RUBY_VERSION + "/" + themodule + "/" + themodulepath
      system("find " + full_module_path + " > autorubyconf-output.txt")
      if $? == 0
        puts "yes (" + themodule + ": " + themodulepath + ")"
      else
        puts "no"
        puts ""
        puts "The " + themodule + " Ruby Module (" + themodulepath + ") was not found."
        abort("Install the module through gem and try again.")
      end
    end
  end
end


def check_rubyversion(current_version, minimum_version)
  current_version.to_s
  minimum_version.to_s

  print "Checking if Ruby is version " + minimum_version + " or newer... "
  if current_version <=> minimum_version
    puts "yes (" + RUBY_VERSION + ")"
  else
    puts "no"
    puts "Ruby version " + RUBY_VERSION + " was detected."
    abort("Upgrade your Ruby interpereter to at minimum version " + minimum_version + " and try again.")
  end
end
