import json

def addAttr():
    with open("tmp/todo.json", "r") as f:
        load_dict = json.load(f)
    print(type(load_dict))
    print(load_dict)
    for dc in load_dict:
        dc["Txt"] =""
    print("----------------------------------")
    print(load_dict)

    with open("todoAll.jsonl", "r") as f:
        for fl in f.readlines():
            print( json.load(fl))
if __name__ == '__main__':
   addAttr()