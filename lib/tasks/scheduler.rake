task weekly_task: :environment do 
  if Time.now.monday?
    rake fixtures
  end
end