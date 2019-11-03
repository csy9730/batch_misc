url="http://localhost:8800/item/a";
for (let i =0;i<10;i++){
    console.log( "quick",i)
    setTimeout(function(){
        console.log("slow",i);
        url2 = url+i;
        location.href=url2;
        location.reload()
    },1000*i);
}

location.href=url2;
location.replace(url2)
location.reload()


timeout=prompt("Set timeout (Second):");
count=0
current=location.href;
if(timeout>0)
    setTimeout('reload()',1000*timeout);
else
    location.replace(current);
function reload(){
    setTimeout('reload()',1000*timeout);
    count++;
    console.log('每（'+timeout+'）秒自动刷新,刷新次数：'+count);
    fr4me='<frameset cols=\'*\'>\n<frame src=\''+current+'\'/>';
    fr4me+='</frameset>';
    with(document){
        write(fr4me);
        void(close());
    };
}
