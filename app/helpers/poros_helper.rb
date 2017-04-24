module PorosHelper

  def programs
    Program.all
  end

  def institutions
    Institution.all_institutions
  end

  def ethnicities
    Ethnicity.all_ethnicities
  end

  def years
    Year.all
  end
end