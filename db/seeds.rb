class Seed

  def self.start
    seed = Seed.new
    seed.create_programs
  end

  def create_programs
    Program.create(cip2:"01", name:"Agriculture, Agriculture Operations, and Related Sciences")
    Program.create(cip2:"02", name: "Agricultural Sciences")
    Program.create(cip2:"03", name:"Natural Resources and Conservation")
    Program.create(cip2:"04", name: "Architecture and Related Services")
    Program.create(cip2:"05", name:"Area, Ethnic, Cultural, Gender, and Group Studies")
    Program.create(cip2:"09", name:"Communication, Journalism, and Related Programs")
    Program.create(cip2:"10", name:"Communications Technologies/Technicians and Support Services")
    Program.create(cip2:"11", name:"Computer and Information Sciences and Support Services")
    Program.create(cip2:"12", name:"Personal and Culinary Services")
    Program.create(cip2:"13", name:"Education")
    Program.create(cip2:"14", name:"Engineering")
    Program.create(cip2:"15", name:"Engineering Technologies and Engineering-Related Fields")
    Program.create(cip2:"16", name:"Foreign Languages, Literatures, and Linguistics")
    Program.create(cip2:"19", name:"Family and Consumer Sciences/Human Sciences")
    Program.create(cip2:"22", name:"Legal Professions and Studies")
    Program.create(cip2:"23", name:"English Language and Literature/Letters")
    Program.create(cip2:"24", name:"Liberal Arts and Sciences, General Studies and Humanities")
    Program.create(cip2:"25", name:"Library Science")
    Program.create(cip2:"26", name:"Biological and Biomedical Sciences")
    Program.create(cip2:"27", name:"Mathematics and Statistics")
    Program.create(cip2:"28", name:"Military Science, Leadership and Operational Art")
    Program.create(cip2:"29", name:"Military Technologies and Applied Sciences")
    Program.create(cip2:"30", name:"Multi/Interdisciplinary Studies")
    Program.create(cip2:"31", name:"Parks, Recreation, Leisure, and Fitness Studies")
    Program.create(cip2:"32", name:"Basic Skills and Developmental/Remedial Education")
    Program.create(cip2:"33", name:"Citizenship Activities")
    Program.create(cip2:"34", name:"Health-Related Knowledge and Skills")
    Program.create(cip2:"35", name:"Interpersonal and Social Skills")
    Program.create(cip2:"36", name:"Leisure and Recreational Activities")
    Program.create(cip2:"37", name:"Personal Awarness and Self-Improvement")
    Program.create(cip2:"38", name:"Philosophy and Religious Studies")
    Program.create(cip2:"39", name:"Theology and Religious Vocations")
    Program.create(cip2:"40", name:"Physical Sciences")
    Program.create(cip2:"41", name:"Science Technologies/Technicians")
    Program.create(cip2:"42", name:"Psychology")
    Program.create(cip2:"43", name:"Homeland Security, Law Enforcement, Firefighting and related protective services")
    Program.create(cip2:"44", name:"Public Administration and Social Service Professions")
    Program.create(cip2:"45", name:"Social Sciences")
    Program.create(cip2:"46", name:"Construction Trades")
    Program.create(cip2:"47", name:"Mechanic and Repair Technologies/Technicians")
    Program.create(cip2:"48", name:"Precision Production")
    Program.create(cip2:"49", name:"Transportation and Material Moving")
    Program.create(cip2:"50", name:"Visual and Performing Arts")
    Program.create(cip2:"51", name:"Health Professions and Related Programs")
    Program.create(cip2:"52", name:"Business, Management, Marketing, and Relate Support Services")
    Program.create(cip2:"53", name:"High School/Secondary Diplomas and Certificates")
    Program.create(cip2:"54", name:"History")
    Program.create(cip2:"60", name:"Residency Programs")
  end    
end
Seed.start