%script for training networks using FR data
%Brnn network
%1 hidden layer
%10-200 neurons testing
%tan-sigmoid activation function
%------------------------------------------------------------------------------------------
%----read files section,using the function---------------------------------
path1='C:/Users/User/Desktop/thesis coding/data for stress strain/ola ta dedomena merged FR/Specimen_RawData_';
nn=25;%number of csv files in fr folder
sizesss=zeros(1,nn);
for k=1:nn
   path2=strcat(path1,int2str(k),'.csv'); 
   data_temp=imp_stress_func(path2,50); 
   siz11=size(data_temp.strain);
   sizesss(k)=siz11(1);
end
sizeall=0;
for k=1:nn
    sizeall=sizeall+sizesss(k); 
end
finalstrainarray=zeros(sizeall,1);
finalstressarray=zeros(sizeall,1);
finalstrain1=zeros(sizeall,1);
finalstrain2=zeros(sizeall,1);
finalkcoeff=zeros(sizeall,1);
initval=1;
finalval=sizesss(1);
for j=initval:finalval
   finalstrainarray(j)=data_temp.strain(j);
   finalstrain1(j)=data_temp.Strain1(j);
   finalstrain2(j)=data_temp.strain2(j);
   finalkcoeff(j)=data_temp.K_coeff_pl(j);
   finalstressarray(j)=data_temp.stress(j);
end
initval=finalval+1;
for k=2:nn
   %finalval=initval+sizesss(k);
   path2=strcat(path1,int2str(k),'.csv'); 
   data_temp=imp_stress_func(path2,50);
   ineerloop=sizesss(k);
   for j=1:ineerloop
       finalstrainarray(initval)=data_temp.strain(j);
       finalstrain1(initval)=data_temp.Strain1(j);
       finalstrain2(initval)=data_temp.strain2(j);
       finalkcoeff(initval)=data_temp.K_coeff_pl(j);
       finalstressarray(initval)=data_temp.stress(j);
       initval=initval+1;
   end
       initval=initval+1;
end   
 sizefinalaall=size(finalstrainarray);
 sizefinalaall=sizefinalaall(1);
 %----
 finalstrain2(sizefinalaall)=0;
 finalstrain2(1:sizefinalaall-1)=finalstrainarray(2:sizefinalaall);
 %----
 finalstrain2(sizefinalaall)=0;
 finalstrain2(sizefinalaall-1)=0;
 finalstrain2(1:sizefinalaall-2)=finalstrainarray(3:sizefinalaall);
 datastructfinal=struct('stress',finalstressarray,'strain',finalstrainarray,'strain1',finalstrain1,'strain2',finalstrain2,'k_coeff',finalkcoeff);
%--------------------------------------------------------------------------
%------divide data to test and train datasets------------------------------
%alternative way
% tsiz=size(finalkcoeff);
% tsiz=tsiz(1);
% trainRatio=0.85;
% validationratio=0;
% testratio=0.15;
% [trainInd,valInd,testInd] = dividerand(tsiz,trainRatio,valRatio,testRatio);
%--------------------------------------------------------------------------
%------train ANN architectures---------------------------------------------
%feedfowrard neural network
trainfunc1='trainbr';
%layersarc=[10];
%---------create cell arrays to save the networks==========================
neuralnetsdtaa1=cell(12,1);
neuralnettrrrrr=cell(12,1);
neuralneterror1=cell(12,1);
%neuralnetaccuracy=cell(12,1);
%---------create table with neurons to vary================================
%layersarc=[10 50 100 200 300 400 500 600 700 800 900 1000];
layersarc=[10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200];
for i=1:20
    disp(i)
    net1 = feedforwardnet(layersarc(i),trainfunc1);
    %----split data to testing and training====================================
    net1.divideParam.trainRatio=0.8;
    net1.divideParam.valRatio=0;
    net1.divideParam.testRatio=0.2;
    %----create input and target matrices======================================
    inputdata=[datastructfinal.strain';datastructfinal.strain1';datastructfinal.strain2'];
    targetdata=datastructfinal.k_coeff';
    %----=Network training and validation======================================
    [net2,trrr1]=train(net1,inputdata,targetdata);
    neuralnetsdtaa1{i}=net2;%save trained network
    neuralnettrrrrr{i}=trrr1;%save trained network
    plotperform(trrr1)
    ytest=net2(inputdata);
    perf1=perform(net2,ytest,targetdata);
    neuralneterror1{i}=perf1;
end   
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%recurrent layer neural network

%--------------------------------------------------------------------------


