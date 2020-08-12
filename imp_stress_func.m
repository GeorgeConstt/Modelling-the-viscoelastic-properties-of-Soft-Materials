%function for importing csv file 
function dtastruct1 = imp_stress_func(pathh1,plinconstant)
%--------------------------------------------------------------------------
%load csv file and filter data
data1=readmatrix(pathh1);
size1=size(data1);%get size of file
%----------------------------------------------
time1=data1(:,1);%read file
extension=data1(:,2);%extension of speciments(mm)
load=data1(:,3);% force applied to the speciment(N)
area=18;%mm(area of the samples)
counter1=0;
initial_length=33;% initial length of the speciment in mm
for i=1:size1(1)
    if (i<=size1(1)-1)
        if (load(i)/load(i+1)*100>=92.2)
            counter1=counter1+1;
        end
    end
end
%filter out the curve from the measurements
load=data1(1:counter1,3);
time1=data1(1:counter1,1);
extension=data1(1:counter1,2);
%-----------------------------------------------------------------------------
%filter out values due to calibration error(negative ones)
load=load(load>=0);
extension=extension(load>=0);
time1=time1(load>=0);
%--------------------------------==============================================
var11=diff(extension)./diff(time1);%displaycement rate for each element
disp_rate=mean(var11);%mean value of displaycement rate
strain_rate23=disp_rate/initial_length;%strain rate is constant for the whole file
strain_rate=zeros(counter1,1);%create an array for the strain rate
%---------------------------------=============================================
stress=load/area;%stress values
strain1=extension/initial_length;%strain value
for k=1:counter1
   strain_rate(k)=strain_rate23; %strain rate from sampling
end    
%%strain_rate=strain_rate23;
%-----------------------------------------------------------------------------
%obtain  constant--just for testing purposes
k_const=diff(load)./diff(extension);% stifness constant for each row of data
%-----------------------------------------------------------------------------
%piecewise linearization for k constant
%-----assistive part for coding-------------------------------------
%-------stresstest=stress(1:50);
%-------straintest=strain1(1:50);
%--------pktestk=straintest\stresstest;%linear regretion on the selected samples(50 samples)
%------piecewise linearization of samples stress and strain----------------
%------assisitve part for coding------------------------------------
%piece wise linearization part
partslin=size(stress);%get size of stress array values
kpln1=plinconstant;%50;%choose how many samples for each linearization
pieceslin=partslin(1)/kpln1;%calculate how many chunks for intervals of 50 samples
pieceslin=floor(pieceslin);
karray=zeros(pieceslin,1);
a=1;
b=kpln1;
karray(1)=strain1(1:kpln1)\stress(1:kpln1);
for j=2:pieceslin
    a=b+1;
    b=kpln1*j+(j-1);
    if (b<=partslin(1))% if (j<pieceslin)
       karray(j)=strain1(a:b)\stress(a:b);%b=b+kpln1+1;
    elseif(b>partslin(1))
        b=partslin(1);
        karray(j)=strain1(a:b)\stress(a:b);%linear reggration
    end    
   
end
%---------==========================================================
%piecewise linearization of k value-obtain n number of k values
%form the dataset with k,stress and strain
finalarr=zeros(partslin(1),1);
a=1;
b=kpln1;
finalarr(a:b)=karray(1);
sizekarray=size(karray);
sizekarray=sizekarray(1);
for t=2:sizekarray 
    a=(t-1)*kpln1+(t-1);
    if (t<sizekarray)
        b=kpln1*t+(t-1);
    end
    if (t==sizekarray)
        b=partslin;
    end    
    finalarr(a:b)=karray(t);
end
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
%filter out nan values and inf values
stress(isinf(stress))=0;
stress(isnan(stress))= 0;
%----
strain1(isinf(strain1))=0;
strain1(isnan(strain1))=0;
%----
strain_rate(isinf(strain_rate))=0;
strain_rate(isnan(strain_rate))=0;
%----
k_const(isinf(k_const))=0;
k_const(isnan(k_const))=0;
%----
finalarr(isinf(finalarr))=0;
finalarr(isnan(finalarr))=0;
%-----------------------------------------------------------------------------
%strain 1 and strain2 calculation
newsizz=size(extension);
newsizz=newsizz(1);
strain1a=zeros(newsizz,1);
strain2a=zeros(newsizz,1);
%----
strain1a(1:(newsizz-1))=strain1(2:newsizz);
strain1a(newsizz)=0;
%----
strain2a(1:(newsizz-2))=strain1(3:newsizz);
strain2a(newsizz-1)=0;
strain2a(newsizz)=0;

%-----------------------------------------------------------------------------
%add everything to a structure
finalarr=(finalarr/area)*initial_length;
dtastruct1=struct('stress',stress,'strain',strain1,'strain_rate',strain_rate,'K_Coefficient',k_const,'K_coeff_pl',finalarr,'Strain1',strain1a,'strain2',strain2a,'Counter1',counter1);
%----------------------------------------------------------------------------------
%----------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

