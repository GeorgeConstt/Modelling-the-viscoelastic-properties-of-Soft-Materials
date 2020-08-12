%script for plotting graphs brnn,LM and activation functions
number_neurons=[10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200];
brnn_test=[115.2 0.173 0.970 0.127 0.126 0.128 0.127 0.115 0.112 11.2001 10.1591 1.2356 0.9877 0.7122 0.18258 0.17988 0.17555 0.17113 0.17008 0.16987];
LM_test=[0.34778 15.7234 0.13348 0.1811 0.19500 10.0850 0.160 1.943 0.0900 0.2000 0.20100 0.21000 0.20018 0.20181 0.20080 0.22112 0.22890 0.23842 0.23000 0.23211];
figure (1)
Brnng=loglog(number_neurons,brnn_test);
hold on
lmg=loglog(number_neurons,LM_test);
hold on
title('Number of Neurons vs test error')
xlabel('number of neurons')
ylabel('Error MSE')
ma1='BRNN algorithm';
ma2='LM algorithm';
legend(ma1,ma2)
%------------------------------------------------------------------------
%two hidden layers
neurons2ndlayer=[10 20 30 40 50 60 70 80 90 100];
brnntest1=[0.09500 0.09100 0.26050 0.21987 0.4008 0.4454 0.3015 0.32012 0.2955 0.3455];
lmtest1=[0.15122 0.1511 0.1355 0.3224 0.311 0.3009 0.2554 0.2500 0.2544 0.2200];
figure (2)
Brnng=loglog(neurons2ndlayer,brnntest1);
hold on
lmg=loglog(neurons2ndlayer,lmtest1);
hold on
title('Number of Neurons vs test error for second layer')
xlabel('number of neurons second layer')
ylabel('Error MSE')
ma1='BRNN algorithm';
ma2='LM algorithm';
legend(ma1,ma2)
%-------------------------------------------------------------------------
%activation function test
act_func=[1 2 3 4];
%logsig,radbass,softmax,tansig
brnntest2=[0.400 0.3784; 0.2800 0.2290; 0.2390 0.23454; 0.1987 0.2460];
figure(3)
bar(act_func,brnntest2)
hold on
title('Activation functions for 3-50-30-1 architecture vs Error')
xlabel('Activation functions')
ylabel('Error MSE')
legend('BRNN','LM')
set(gca, 'XTick', 1:4, 'XTickLabels', {'Logsig','Radbas','Sostmax','Tansig'})