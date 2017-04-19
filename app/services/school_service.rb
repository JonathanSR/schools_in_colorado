class SchoolService
attr_reader :connection

  def initialize
    @connection = Faraday.new("https://data.colorado.gov/resource/yt5k-hawq.json") do |c|
      c.use Faraday::Response::RaiseError
      c.use Faraday::Adapter::NetHttp
    end
  end

  def find_ethnicity_program_graduates(college, program, ethnicity, year)
   parse(connection.get("?ethnicity=#{ethnicity}&year=#{year}&institutionname=#{college}&cip2=#{program}"))
  end
 
  def find_all_graduates_of_program(college, program, year)
    parse(connection.get("?year=#{year}&institutionname=#{college}&cip2=#{program}"))
  end

  def find_all_ethnicity_graduates(college, ethnicity, year)
    parse(connection.get("?year=#{year}&institutionname=#{college}&ethnicity=#{ethnicity}"))
  end

  def get_data
    Rails.cache.fetch("all_data") do
      parse(connection.get("https://data.colorado.gov/resource/yt5k-hawq.json"))
    end
  end    

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end