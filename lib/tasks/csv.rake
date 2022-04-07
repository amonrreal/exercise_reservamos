namespace :csv do
  desc "Import CSV"
  task insert: :environment do
    ImportData.new().insert
  end
end