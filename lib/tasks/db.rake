if Rails.env.development?
  namespace :db do

    desc "Drops, creates and migrates the database with some seed"
    task bounce: [:"db:drop", :"db:create", :"db:migrate", :"db:seed"]

  end
end