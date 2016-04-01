namespace :parse do
  task categories: :environment do
    added   = []
    invalid = []
    skipped = []

    CSV.foreach(File.expand_path("../../../db/models.csv", __FILE__), col_sep: ";", headers: true) do |row|
      code = row[1]
      make = row[2]
      kind = row[3]
      years = row[4]
      if Handle.where(make: make, kind: kind).exists?
        next skipped.push "#{make} - #{kind} - #{years}"
      end

      handle = Handle.new(
        code: code,
        make: make,
        kind: kind,
        years: years
      )
      if handle.save
        added.push handle
      else
        invalid.push handle
      end
    end
    Handle.where(make: nil).destroy_all
    puts "added: (#{added})"
    puts "invalid (#{invalid})"
    puts "skipped (#{skipped})"
  end
end