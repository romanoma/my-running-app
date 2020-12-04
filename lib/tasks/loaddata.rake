namespace :loaddata do
  desc "TODO"
  task routes: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "Book1.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      c = Run.new
      c.city = row["city"].to_s
      c.start = row["start"].to_s
      c.end = row["end"].to_s
      c.distance = row["distance"].to_s
      c.track_type = row["track_type"].to_s
      c.hills = row["hills"].to_s
      
      c.save
    end
    
    puts "There are now #{Course.count} rows in the courses table"
  end

end
