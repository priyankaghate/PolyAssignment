namespace :rake_demo do
	desc "Displays the message"
	task :demo do
		puts "Hey it's my first task, which i have created."
	end

	desc "Displays title of first post"
	task :post_title => :environment do
		p=Post.first
		puts "#{p.title}"
	end
end