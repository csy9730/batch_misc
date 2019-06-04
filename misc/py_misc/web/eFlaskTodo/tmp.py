import json
def main():
    dct = []
    with open("todoAll.jsonl", "r") as f:
        while True:
            text_line = f.readline()
            if text_line:
                print(type(text_line), text_line)
                load_dict = json.loads(text_line)
                #print(load_dict)
                dct.append(load_dict)
            else:
                break
            #f.readline()
        #load_dict = json.load(f)
    #print(load_dict)
    print("end",dct)
    print(dct[0])
    # 返回json序列化的数据

if __name__ == '__main__':
    main()