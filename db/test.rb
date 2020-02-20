require 'open-uri'
require 'nokogiri'

url = 'https://www.google.com/search?q=leafly+jack+herer&tbm=isch&ved=2ahUKEwif_e2Q4uDnAhWn2-AKHbUoDYcQ2-cCegQIABAA&oq=leafly+jack+herer&gs_l=img.3...0.0..5625...0.0..0.0.0.......0......gws-wiz-img.nC5fczfHOY8&ei=1tBOXp-6GKe3gwe10bS4CA&bih=1018&biw=1792'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

p html_doc
