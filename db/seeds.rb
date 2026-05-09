# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create admin user
admin = User.find_or_create_by!(email: 'admin@ops.com') do |u|
  u.password = 'password123'
  u.display_name = 'Admin User'
  u.username = 'admin'
  u.role = 'admin'
  u.bio = 'Administrator of AgoraFlow'
end

# Create sample user
user = User.find_or_create_by!(email: 'user@ops.com') do |u|
  u.password = 'password123'
  u.display_name = 'Sample User'
  u.username = 'sampleuser'
  u.role = 'user'
  u.bio = 'A sample user for testing'
end

# Create sample tags
tags = [ 'technology', 'policy', 'development', 'agriculture', 'innovation' ]
tags.each do |tag_name|
  tag = Tag.find_or_initialize_by(slug: tag_name.parameterize)
  tag.name = tag_name
  tag.save!
end

# Create sample project
project = Project.find_or_create_by!(slug: 'master-apps') do |p|
  p.owner = admin
  p.title = 'Master Apps'
  p.summary = 'Collection of master applications for various domains'
  p.description = 'A suite of applications designed to solve real-world problems.'
  p.status = 'active'
  p.visibility = 'public'
  p.demo_url = 'https://demo.ops.com'
  p.github_url = 'https://github.com/ytimesy/master-apps'
end

# Create sample policy proposal
policy = PolicyProposal.find_or_create_by!(slug: 'revate-agri') do |pp|
  pp.owner = admin
  pp.related_project = project
  pp.title = 'Revate Agri - Agricultural Income Optimization'
  pp.summary = 'System to optimize agricultural income through data-driven insights'
  pp.background = 'Farmers face challenges in maximizing income from their operations.'
  pp.problem = 'Lack of real-time data on income, expenses, and profitability.'
  pp.proposal = 'Implement Revate Agri system for comprehensive farm management.'
  pp.target_users = 'Farmers, agricultural cooperatives, local governments'
  pp.system_outline = 'Web application with mobile app for data collection and analysis.'
  pp.expected_effect = '20% increase in farm profitability through optimized operations.'
  pp.risks = 'Data privacy concerns, initial adoption resistance.'
  pp.pilot_plan = 'Pilot in 3 agricultural regions within 6 months.'
  pp.status = 'public'
  pp.visibility = 'public'
end

# Create sample post
post = Post.find_or_create_by!(title: 'Welcome to AgoraFlow') do |p|
  p.user = admin
  p.project = project
  p.post_type = 'announcement'
  p.body = 'AgoraFlow is a next-generation platform for sharing ideas, projects, and policy proposals.'
  p.visibility = 'public'
  p.status = 'published'
  p.published_at = Time.current
end

# Associate tags with post
tech_tag = Tag.find_by(name: 'technology')
post.tags << tech_tag if tech_tag && !post.tags.include?(tech_tag)

puts "Seed data created successfully!"
