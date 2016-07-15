=begin
 Pseudocode/planning   
1. Parse the CSV file into Ruby objects
    1.1 Define parser method
2. Create Violation class
    2.1 Initialize violation objects
    2.2 Process collection of violation objects
    2.3 Calculate violation counts by category
    2.4 For each category calculate earliest violation
    2.5 For each category calculate latest violation 
3. Display results
=end

require 'csv'

module ViolationCSVParser
    def self.parse
        csv = CSV.open('Violations-2012.csv', :headers => true, :header_converters => :symbol, :converters => :all)
        csv_hash = csv.to_a.map {|row| row.to_hash }
    end
end

class Violation
    include ViolationCSVParser

    attr_reader :violation_category, :violation_date

    def initialize(args)
        @violation_id = args[:violation_id]
        @inspection_id = args[:inspection_id]
        @violation_category = args[:violation_category]
        @violation_date = args[:violation_date]
        @violation_date_closed = args[:violation_date_closed]
        @violation_type = args[:violation_type]
    end

    def self.populate_violation_collection
        violations_raw_data = ViolationCSVParser.parse
        @@violation_collection = Array.new

        violations_raw_data.each do |violation|
            @@violation_collection << Violation.new(violation)
        end

        @@violation_collection
    end

    def self.violations_by_category
        @@results = Hash.new { |hash, key| hash[key] = {} }

        @@violation_collection.each do |violation|
            if @@results[violation.violation_category]["violation_count"] 
                @@results[violation.violation_category]["violation_count"] += 1
            else
                @@results[violation.violation_category]["violation_count"] = 1
            end
        end

        @@results
    end

    def self.violation_per_category_by_time
        categories = @@results.keys

        categories.each do |category|
            @@results[category]["earliest_violation_date"] = @@violation_collection.select { |violation| violation.violation_category == category }.sort_by { |violation| violation.violation_date }.first.violation_date
            @@results[category]["latest_violation_date"] = @@violation_collection.select { |violation| violation.violation_category == category }.sort_by { |violation| violation.violation_date }.last.violation_date
        end

        @@results
    end

    def self.display_results
        @@results.each do |violation, data|
            puts <<-LIST
#{violation} has #{data["violation_count"]} violations, earliest violation date: #{data["earliest_violation_date"].strftime("%F")}, latest violation date: #{data["latest_violation_date"].strftime("%F")} 
            LIST
        end
    end
end

#Driver code
Violation.populate_violation_collection
Violation.violations_by_category
Violation.violation_per_category_by_time
Violation.display_results