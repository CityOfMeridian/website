namespace :meetings do
  task :delete_duplicates do
    Meeting.delete_duplicates!
  end
end