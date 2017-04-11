class SchoolService
attr_reader :connection


  # def initialize
  #   @connection = Faraday.new("https://data.colorado.gov/resource/yt5k-hawq.json?$$app_token=#{ENV['SCHOOL_KEY']}")
  #  @connection.headers[:Authorization] = "#{ENV["SCHOOL_KEY"]}"
  #  byebug
  # end

  def self.find_graduates(college, program, ethnicity, year)
    response = Faraday.get("https://data.colorado.gov/resource/yt5k-hawq.json?ethnicity=#{ethnicity}&year=#{year}&institutionname=#{college}&cip2=#{program}")
    final = JSON.parse(response.body, symbolize_names: true)
   # byebug
  end

#   def self.find_by_search(college, program, ethnicity, year)
#     byebug
#     parse(connection.get("&ethnicity=#{ethnicity}&year=#{year}&institutionname=#{college}&cip2=#{program}"))
#   end

# private
#   def parse(response)
#     JSON.parse(response.body, symbolize_names: true)
#   end
end