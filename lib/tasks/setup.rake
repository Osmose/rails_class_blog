namespace :blog do
    task :setup_admin => :environment do
        User.delete_all(
            :admin => true
        )
        
        user = User.create! do |u|
            u.name = ENV["a_name"]
            u.email = ENV["a_email"]
            u.password = ENV["a_pw"]
            u.password_confirmation = ENV["a_pw"]
            u.admin = true
        end
        puts "User created successfully!"
    end
    
    task :clear_users => :environment do
        User.delete_all()
    end
    
    task :clear_posts => :environment do
        Post.delete_all()
    end
end