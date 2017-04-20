require 'rails_helper'

describe School do
  context "find queried graduates" do
    it "returns an array of school objects" do
      VCR.use_cassette('/models/queried_graduates') do

        schools = School.find_ethnicity_program_graduates("Colorado State University", "14", "Hispanic", "2015")
        school = schools[0]
        expect(schools.class).to eq(Array)
        expect(school.college).to be_truthy
        expect(school.program).to be_truthy
        expect(school.ethnicity).to be_truthy
        expect(school.year).to be_truthy
      end
    end
  end

  context "find all graduates" do
    it "returns a count of all graduates for the program queried for that year"do
      VCR.use_cassette('/models/program_graduates') do      

        graduates = School.find_all_graduates_of_program("Colorado State University", "14", "2015")

        expect(graduates).to eq(197)
      end
    end
  end

  context "find graduates count for college,program,ethnicity,year query" do
    it "returns a count of all garduates" do
      VCR.use_cassette('/models/queried_graduates_count') do      

        graduates = School.find_queried_graduates_count("Colorado State University", "14", "Hispanic", "2015")

        expect(graduates).to eq(14)
      end
    end
  end

  context "finds all graduates across the college for the selected ethnicity" do
    it "returns a count of that query" do
      VCR.use_cassette('/models/ethnicity_graduates') do      

        graduates = School.find_all_ethnicity_graduates("Colorado State University", "Hispanic", "2015")

        expect(graduates).to eq(247)
      end
    end
  end

  context "find the percentage of ethnicity graduates of a program against the field of that program" do
    it "returns the percentage" do
      VCR.use_cassette('/models/program_final') do      
      
        all_graduates = School.find_all_graduates_of_program("Colorado State University", "14", "2015")
        ethnicity_graduates = School.find_queried_graduates_count("Colorado State University", "14", "Hispanic", "2015")
      
        total = School.percentage_of_ethnicity_graduates_for_that_program
      
        expect(total).to eq('0.071')
      end
    end
  end

  context "finds the percentage of ethnicity graduates of a program against all programs for that ethnicity" do
    it "returns the percentage" do
      VCR.use_cassette('/models/total_graduates') do      
      
        program_graduates = School.find_queried_graduates_count("Colorado State University", "14", "Hispanic", "2015")
        all_graduates = School.find_all_ethnicity_graduates("Colorado State University", "Hispanic", "2015")
      
        total = School.percentage_of_ethnicity_graduates_of_program_against_all_programs_for_that_ethnicity

        expect(total).to eq('0.057')
      end
    end
  end 
 end