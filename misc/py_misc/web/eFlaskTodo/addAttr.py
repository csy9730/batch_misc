
import os,sys
import json

class job(object):
    def __init__(self):
        pass
        self.Id = 0
        self.Name = ""
        self.Datetime=""
        self.Tag = "relax"
        self.Height = 0
        self.Txt= ""
        self.Misc=""
    def __dict__(self):
        return dict()
    def update(self,**kwargs):
        return

dct = {
    "Id": "22",
    "Name": "PyinstallPy",
    "Datetime": "2019-05-15 15:07:48",
    "Tag": "work",
    "Height": "0",
    "Txt": "",
    "Misc": ""
}
# id从1开始，id=0默认不可用
#  parentProject=0视为无父级项目。
class jobList(object):
    def __init__(self,filename="todo.json"):
        self.filename = filename
        self.historyname = filename+'line'
        if not os.path.exists( self.filename):
            with open(self.filename, "w") as f:
                json.dump([],f)
        if not os.path.exists( self.historyname):
            with open(self.historyname, "a+") as f:
                pass 
    def __dict__(self):
        return dict()
    def getHistoryList(self):
        load_dict = []
        with open(self.historyname, "r",encoding="utf-8") as f:
            while True:
                text_line = f.readline()
                if text_line:
                    print(type(text_line), text_line)
                    dct = json.loads(text_line)
                    #print(load_dict)
                    load_dict.append(dct)
                else:
                    break
        return load_dict
    def getList(self):
        with open(self.filename, "r",encoding="utf-8") as f:
            load_dict = json.load(f)
        self.dat = load_dict
        return load_dict
    def setList(self,lst):
        with open(self.filename, "w",encoding="utf-8") as f:
            json.dump(lst,f,ensure_ascii=False)
    def appendHistoryList(self,lst):
        with open(self.historyname, "a+",encoding="utf-8") as f:
            for dt in lst:
                f.write(json.dumps(dt,ensure_ascii=False))
                f.write("\n")
    # depreciated
    def append(self,dt):
        data = self.getList()
        data.append(dt)
        # 将此时最新的数据再次写入文件中
        with open(self.filename, "w") as f:
            f.write(json.dumps(data))
        with open(self.historyname, "a+") as f:
            f.write(json.dumps(dt))
            f.write("\n")
        return data
    def delObj(self,obj):
        data = self.getList()
        del(data[-1])
        with open(self.filename, "w") as f:
            f.write(json.dumps(data))
    def setObj(self,dt):
        data = self.getList()
        for i in range(len(data)):
            if data[i]["Id"] == dt["Id"]:
                print("del ",data[i])
                dt["Misc"]=data[i]["Misc"]+dt["Misc"]+";"
                del data[i]
                break
        data.append(dt)
        # 将此时最新的数据再次写入文件中
        self.setList(data)
        self.appendHistoryList( dt)
        return data
    
    def listAddAttr(self):
        load_dict = self.getList()
        flt_dict = list(filter(addAttr,load_dict))
        print(flt_dict) ###
        self.setList(flt_dict)
        lst = self.getHistoryList()
        flt_lst = list(filter(addAttr,lst))
        print(flt_lst) 
        with open(self.historyname, "w") as f:pass
        self.appendHistoryList(flt_lst)

def addAttr(dc):
    dc["Id"] =int(dc["Id"] )
    dc["Height"] =int(dc["Height"] )
    if not "IsProject" in dc:
        dc["IsProject"] =False
    if not "ParentProject" in dc:
        dc["ParentProject"] =0
    return dc

if __name__ == '__main__':
    jobs = jobList()
    jobs.listAddAttr()