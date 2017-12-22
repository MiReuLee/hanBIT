pos = 0
no = 0

INIT_SIZE = 5
noArr = [] * INIT_SIZE
tArr = [] * INIT_SIZE
wArr = [] * INIT_SIZE

def list():
    print("전체 " + pos + "개\n", )
    print("-------------------------------")
    print("번호\t글쓴이\t제목")
    print("-------------------------------")
    i = 0
    for val in noArr:
        i = i + 1
        print(val, wArr[i], tArr[i])
    if pos == 0:
        print("게시물이 존재하지 않습니다.")
    print("-------------------------------")


def detail():
    findNo = int(input("조회할 글번호를 입력하세요 : "))
    print("-------------------------------")
    flag = False

    i = 0
    for val in noArr:
        i = i + 1
        if findNo == val:
            flag = True
            print("번호 : " + findNo)
            print("글쓴이 : " + wArr[i])
            print("제목 : " + tArr[i])

    if flag == False:
        print("입력된 번호는 존재하지 않습니다.")

    print("-------------------------------")

def insert(pos, noArr, tArr, wArr):
    print("sdfsdfd")
    if pos == noArr.__len__():
        tNoArr = [] * (pos * 2)
        tTitleArr = [] * (pos * 2)
        tWriterArr = [] * (pos * 2)

        tNoArr.extend(noArr)
        tTitleArr.extend(tArr)
        tWriterArr.extend(wArr)

        noArr = tNoArr
        tArr = tTitleArr
        wArr = tWriterArr

    noArr[pos] = ++no
    tArr[pos] = input("제목을 입력하세요 : ")
    wArr[pos] = input("글쓴이를 입력하세요 : ")

    pos = pos + 1
    print("게시글 등록이 완료되었습니다.")

while True:
    print("------------------------------------")
    print("1. 전체 게시물 조회")
    print("2. 글번호 조회")
    print("3. 글등록")
    print("4. 글수정")
    print("5. 글삭제")
    print("0. 종료")
    print("------------------------------------")

    menu = int(input("메뉴 중 처리할 항목을 선택하세요 : "))

    def f(menu):
        return {
            '1': list(),
            "2": detail(),
            "3": insert(pos, noArr, tArr, wArr)
        }.get(
            menu, ''
        )