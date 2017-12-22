# 크롤링
from bs4 import  BeautifulSoup

html = """
    <html>
        <head><title>테스트</title><head>
        <body>
            <div id="test"><a href="#1">연습</a></div>
            <div id="list">
                <ul class="item_ul">
                    <li><a href="http://www.naver.com><b>네이버</b></a></li>
                    <li><a href="http://www.daum.net><b>다음</b></a></li>
                    <li><a href="http://www.google.com/ncr><b>구글</b></a></li>
                </ul>
            </div>
        </body>
    </html>
"""

soup = BeautifulSoup(html, "html.parser")

div_tags = soup.find_all("div", {"class": "list"})
print(div_tags)

ul_tag = div_tags[0].find("ul")
print(ul_tag)