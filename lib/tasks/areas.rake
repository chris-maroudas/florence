namespace :areas do

  desc "Import areas from CSV"
  task import: :environment do
    require 'csv'
    csv_text = File.read('public/greek_areas.csv')
    csv = CSV.parse(csv_text, headers: false)
    csv.each do |row|
      unless row[4] == 'ΤΑΧ. ΓΡΑΦΕΙΟ' || row[4] == 'ΤΑΧ. ΘΥΡΙΔΑ' || row[3].blank? || row[4].blank?
        if row[3].include?('ΠΡΟΑΣΤΙΑ')
          current_title = row[4] + ' (' + row[3] + ')'
          Area.create title: current_title unless Area.exists?(title: current_title)
        else
          begin
            current_title = row[3] + ' (' + row[4] + ')'
          rescue
            binding.pry
          end
          Area.create title: current_title unless Area.exists?(title: current_title)
        end
      end
    end
  end

end
