from urllib.request import urlopen
from bs4 import  BeautifulSoup

html = urlopen("http://comic.naver.com/webtoon/weekday.nhn").read().decode("utf-8")

soup = BeautifulSoup(html, "html.parser")

yoilList = soup.find("div", {"class": "list_area"}).find_all("div", {"class": "col"})

for yoil in yoilList:
    print(yoil.find("span").string)
    for web in yoil.find_all("a", {"class": "title"}):
        print(web.string, end=", ")
    print("\n")