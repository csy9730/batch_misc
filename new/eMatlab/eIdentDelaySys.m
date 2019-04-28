clc;close all;clear;
%%
DELAYS = 15.5;
sys = tf([-0.01394 0.01594],[1,0.01635, 1.864e-5],'IODelay',DELAYS);
figure; step(sys);
sysD0 = c2d(sys,1)
%%
NN= 400;Ts = 10;
tt= (0:1:NN-1)*Ts;
uu= [(rand(1,NN/2)>0.75) (rand(1,NN/2)>0.25)  ]-0.5;
yy = lsim(sys,uu,tt);
figure;plot(yy)
%%
%polyval([1,2,13,14,5],[1,2,3,4,5],[1:0.5:5])
delayNum= 2;ofs = 30;
uyM = zeros(NN-ofs+1,4);zrArr=[];nd2Arr=[];
for delayNum = 0:9
    for i= ofs:NN
        ud = [uu(i-1-delayNum) uu(i-2-delayNum)];
        % ud = [uu(i-delayNum) uu(i-1-delayNum) uu(i-2-delayNum)]*[0.5,0;0.5 0.5;0 0.5];
        uy =  [yy(i-1) yy(i-2) ud];
        uyM (i-ofs+1,:) = uy;
    end
    yy2= yy(ofs:NN)+randn(NN-ofs+1,1)*0.01;
    nd2 =pinv(uyM'*uyM+ 0.01*eye(size(uyM,2))) * (uyM'*yy2)
    %nd2= uyM\yy2
    zr = norm(yy2- uyM*nd2)
    % figure;plot(yy2,'or');hold on;plot(uyM*nd2);
    zrArr=[zrArr zr];
    nd2Arr=[nd2Arr nd2];
end

%%
[~,idx ]= min(zrArr)
idx = max(1,idx-0);
%%
nd2 = nd2Arr(:,idx);
figure;plot(yy2,'or');hold on;plot(uyM*nd2);
sysD = tf( nd2(3:4)',[1  -nd2(1:2)'],Ts,'ioDelay',(idx-1));
figure;step(sysD);
sysC2 = d2c(sysD)