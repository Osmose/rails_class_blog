namespace :blog do
    task :setup_admins => :environment do
        User.delete_all(
            :admin => true
        )
        
        user = User.create! do |u|
            u.name = ""
            u.email = ""
            u.password = ""
            u.password_confirmation = ""
            u.admin = true
        end
        puts "User created successfully!"
    end
    
    task :clear_users => :environment do
        User.delete_all()
    end
end