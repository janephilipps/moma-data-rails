class DataController < ActionController::Base

  # Data visualization for # of artists in collection based on birth year
  # 3820 records with no birth year recorded
  # 15549 - 3820 = 11,729 total records accounted for
  # X Axis: Birth Year
  # Y Axis: Total #

  # Data format for chart:
  # [{year: "1914", total: 4}, {year: "1916", total: 2}]

  require "csv"

  def index

    data = {}

    CSV.foreach("Artists.csv", :headers => true) do |row|
      birth_year = row[5]
      if data[birth_year] == "0"
        puts row
      else
        if data[birth_year]
          data[birth_year] += 1
        else
          data[birth_year] = 1
        end
      end
    end

    @sorted_data = data.sort_by{|k, v| k}
  end

end