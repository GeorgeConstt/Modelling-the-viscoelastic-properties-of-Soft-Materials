pathh1='C:/Users/User/Desktop/tong sinergasia/1mm position data';
data1=readmatrix(pathh1);
time1=data1(1:140,1);
outp11=data1(1:140,2);
input11=data1(1:140,3);
outp22=data1(:,4);
figure (1)
inp1=plot(time1,input11);
hold on
outp1=plot(time1,outp11);
hold on
%outp2=plot(time1,outp22);
%hold on
title('Response of plant1 at 1 mm position')
xlabel('time(s)')
ylabel('Position(mm)')
ma1='step input';
ma2='1mm response';
%ma3='30mm response';
legend(ma1,ma2)
%-------------------------------------------------------------------------
