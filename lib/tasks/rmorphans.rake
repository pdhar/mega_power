task :greet do
  
  puts "hello world"
end

task :remove_orphan => :environment do
  
  Servicepartsment.where([
    "service_id NOT IN (?) OR part_id NOT IN (?)",
    Service.pluck("id"),
    Part.pluck("id")
  ]).destroy_all
  
  puts "Orphan Records Removed!!"
end