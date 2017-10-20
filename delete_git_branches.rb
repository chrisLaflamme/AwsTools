def delete_git_branches branch_name
  return "git checkout #{branch_name}"
end

desc "Delete all non-master local git branches"
task :kill_branches do
  branches = []
  # find and push each branch to branches[]
  Dir.foreach(".git/refs/heads") { |line| branches.push line }
  # fancy formatting stuff
  80.times { print "#".colorize(:green) }
  puts "\n"
  # call delete_git_branches for each branch
  branches.each do |branch|
    if (branch != ".") && (branch != "..") && (branch != "master") #NOTE: there has to be a cleaner/"Rubier" way
      sh delete_git_branches branch
    end
  end
end
