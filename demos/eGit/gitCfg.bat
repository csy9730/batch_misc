git config --global user.name hanmeimei
git config --global user.email  hanmeimei@abc.cn
git config --global core.autocrlf false
git config --global core.safecrlf false
git config --global core.quotepath false

ssh-keygen -t rsa -b 4096

pause
git clone git@gitlab:zal/zal_lib.git

pause
git branch -a
git checkout -b feature-abc origin/feature-abc
git pull
