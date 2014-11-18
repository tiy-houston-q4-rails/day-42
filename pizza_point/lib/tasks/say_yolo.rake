
desc "Say Yolo"
task :yolo => :environment do
  puts "Number of Pizza Joints: #{PizzaJoint.count}"
end
