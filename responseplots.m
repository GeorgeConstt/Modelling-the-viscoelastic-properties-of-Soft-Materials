%plot responses
pathh1='C:/Users/User/Desktop/final feedback notes/final excelfiles data graphs control/plant1step';
data1=readmatrix(pathh1);
time1=data1(:,1);
stressrel=data1(:,2);
nostressrel=data1(:,3);
input1=data1(:,4);
figure (1)
inp1=plot(time1,input1);
hold on
outp1=plot(time1,stressrel);
hold on
outp2=plot(time1,nostressrel);
hold on
title('Response of plant1 with and without stress relax effect')
xlabel('time(s)')
ylabel('Position(mm)')
ma1='step input';
ma2='Stress relax effect';
ma3='No stress relax effect';
legend(ma1,ma2,ma3)
%-------------------------------------------------------------------------
pathh1='C:/Users/User/Desktop/final feedback notes/final excelfiles data graphs control/plant1steplimited';
data1=readmatrix(pathh1);
time1=data1(:,1);
stressrel=data1(:,2);
nostressrel=data1(:,3);
input1=data1(:,4);
figure (2)
inp1=plot(time1,input1);
hold on
outp1=plot(time1,stressrel);
hold on
outp2=plot(time1,nostressrel);
hold on
title('Response of plant1 with and without stress relax effect')
xlabel('time(s)')
ylabel('Position(mm)')
ma1='step input';
ma2='Stress relax effect';
ma3='No stress relax effect';
legend(ma1,ma2,ma3)
%--------------------------------------------------------------------------
pathh1='C:/Users/User/Desktop/final feedback notes/final excelfiles data graphs control/plant4step';
data1=readmatrix(pathh1);
time1=data1(:,1);
stressrel=data1(:,2);
nostressrel=data1(:,3);
input1=data1(:,4);
figure (3)
inp1=plot(time1,input1);
hold on
outp1=plot(time1,stressrel);
hold on
outp2=plot(time1,nostressrel);
hold on
title('Response of plant1 with and without stress relax effect')
xlabel('time(s)')
ylabel('Position(mm)')
ma1='step input';
ma2='Stress relax effect';
ma3='No stress relax effect';
legend(ma1,ma2,ma3)
%--------------------------------------------------------------------------
pathh1='C:/Users/User/Desktop/final feedback notes/final excelfiles data graphs control/plant4steplimited';
data1=readmatrix(pathh1);
time1=data1(:,1);
stressrel=data1(:,2);
nostressrel=data1(:,3);
input1=data1(:,4);
figure (4)
inp1=plot(time1,input1);
hold on
outp1=plot(time1,stressrel);
hold on
outp2=plot(time1,nostressrel);
hold on
title('Response of plant1 with and without stress relax effect')
xlabel('time(s)')
ylabel('Position(mm)')
ma1='step input';
ma2='Stress relax effect';
ma3='No stress relax effect';
legend(ma1,ma2,ma3)
%--------------------------------------------------------------------------
pathh1='C:/Users/User/Desktop/final feedback notes/final excelfiles data graphs control/plant1disturbance';
data1=readmatrix(pathh1);
time1=data1(:,1);
nostressrel=data1(:,2);
input1=data1(:,3);
figure (5)
inp1=plot(time1,input1);
hold on
outp1=plot(time1,nostressrel);
hold on
title('Response of plant1 using disturbance approach')
xlabel('time(s)')
ylabel('Position(mm)')
ma1='step input';
ma2='Disturbance approach';
legend(ma1,ma2)
%--------------------------------------------------------------------------



