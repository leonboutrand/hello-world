require "open-uri"
require "nokogiri"

def scrape_craiglist_antiques(journee)
  # TODO: return an array of Antiques found of Craiglist for this `city`.
  j = journee < 6 ? "0" + (journee + 4).to_s : (journee + 6).to_s
  html_content = open("https://www.lequipe.fr/Football/FootballResultat634#{j}.html").read
  doc = Nokogiri::HTML(html_content)
  results = []
  dom = []
  ext = []
  # p doc
  doc.search("#Base .resultat .score a").each do |element| # '.stage-finished .score'
    results << element.text.strip
  end

  doc.search("#Base .resultat .equipeDom a").each do |element| # '.stage-finished .score'
    dom << element.text.strip
  end

  doc.search("#Base .resultat .equipeExt a").each do |element| # '.stage-finished .score'
    ext << element.text.strip
  end

  results.each_with_index do |x, i|
    p "#{dom[i][0...dom[i].index(" ")]} #{x} #{ext[i][0..ext[i].index("(")-2]}" # [0...ext[i].index(" ")]
  end
  # results #Base .resultat .equipeDom a
end

p "Quelle journée ?"
print ">> Journée : "
x = gets.chomp
puts "\nVoici les scores pour la journée #{x}"
scrape_craiglist_antiques(x.to_i)

