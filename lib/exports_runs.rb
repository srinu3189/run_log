require 'csv'

class ExportsRuns
  def self.to_csv(runs)
    csv_string = CSV.generate do |csv|
      csv << ["run_id", "date", "miles", "time", "mpw", "description"]
      runs.each do |run|
        csv << [run.id, run.date, run.miles, run.time, run.mpw, run.description]
      end
    end
    csv_string
  end
end
