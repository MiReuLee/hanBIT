class General:
    def __init__(self):
        print("생성자 호출")
    def __del__(self):
        print("소멸자 호출")

g = General()