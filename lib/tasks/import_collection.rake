require "csv"

def import_collection(collection_id, file_path)
  collection = Collection.find(collection_id)
  raise "no such collection: #{collection_id}" if collection.blank?

  lines = CSV.read(file_path)
  lines.each.with_index do |line, i|
    next if i == 0

    next if line[0].blank? && line[1].strip.blank?

    card = collection.cards.build(collection_number: line[0].to_i, name: line[1].strip)
    card.save! unless collection.cards.find_by(collection_number: line[0].to_i)
  end
end


namespace :collection do
  desc "Import a list of collections from a csv file"
  task :import_from_csv, [:collection_id, :file_path] => :environment do |t, args|
    import_collection(args[:collection_id].to_i, args[:file_path].strip)
  end
end
