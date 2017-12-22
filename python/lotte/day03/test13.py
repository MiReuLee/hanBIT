class Phone:
    def call(self):
        print("전화 걸기")

    def sound(self):
        print("따르르릉")


class Camera:
    def photo(self):
        print("사진 찍기")

    def sound(self):
        print("찰칵")


class SmartPhone(Phone, Camera):
    def internet(self):
        print("인터넷 검색하기")


sp = SmartPhone()

sp.call()
sp.photo()
sp.internet()
sp.sound()