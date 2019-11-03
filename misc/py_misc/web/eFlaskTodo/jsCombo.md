JS动态改变select选择变更option的index值
document.getElementById("louyuming").options[0].selected=true;

态删除select中的所有options：
function deleteAllOptions(sel){
sel.options.length=0;
}
动态删除select中的某一项option：
function deleteOption(sel,indx){Clear
sel.options.remove(indx);
}
动态添加select中的项option:
function addOption(sel,text,value){
sel.options.add(new Option(text,value));
}

options.length = 0; 