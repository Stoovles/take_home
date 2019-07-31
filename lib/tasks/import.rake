require 'csv'

namespace :import do
  desc "Import from CSV file"

  task olympians: :environment do
    converter = lambda { |header| header.downcase }
    CSV.foreach('./lib/olympic_data.csv', headers: true, header_converters: converter) do |row|
      Olympian.create(row.to_h)
    end
  end

end
