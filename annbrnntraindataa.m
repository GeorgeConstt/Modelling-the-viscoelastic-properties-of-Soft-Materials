%data train ann
pathh1='C:/Users/User/Desktop/trainannextrraaa/datatrainannextra';
data1=readmatrix(pathh1);
stress=data1(:,1);
strain=data1(:,2);
strain1=data1(:,3);
strain2=data1(:,4);
k_coeff=data1(:,5);
%------------------------------------------------------------------------
trainfunc1='trainbr';
layersarc={[50 20]};
for i=1:1
    disp(i)
    tempkk=layersarc{1,i};
    net1 = feedforwardnet(tempkk,trainfunc1);
    %----split data to testing and training====================================
    net1.divideParam.trainRatio=0.8;
    net1.divideParam.valRatio=0;
    net1.divideParam.testRatio=0.2;
    actfunct11={'tansig'};
    net1.layers{1}.transferFcn=actfunct11{1,i};
    net1.layers{2}.transferFcn=actfunct11{1,i};
    %----create input and target matrices======================================
    inputdata=[strain';strain1';strain2'];
    targetdata=k_coeff';
    %----=Network training and validation======================================
    [net2,trrr1]=train(net1,inputdata,targetdata);
    neuralnetsdtaa1{i}=net2;%save trained network
    neuralnettrrrrr{i}=trrr1;%save trained network
    plotperform(trrr1)
    ytest=net2(inputdata);
    perf1=perform(net2,ytest,targetdata);
    neuralneterror1{i}=perf1;
end