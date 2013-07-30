% this fucntion is to simplify the training part. 
% Input: Data a matrix with each column as a data point. 
         % num_phase: number of phases in the hmm
         %aij: inital transition from i to j, i~=j;
         % P: output distribution
% numDataSet: split data into numDataSet smaller data sets.         

function [hmm, probability] = trainHmm(data,num_phases,aij,P,numDataSet)

if nargin <5
    numDataSet =1;
end
dataLength = size(data,2);
remain = rem(dataLength,numDataSet);
dataSetsSize = (dataLength-remain)/numDataSet;
xlT = zeros(1,numDataSet);

for i=1:numDataSet-1
     xlT(i) = dataSetsSize; % element of this vector gives the length of each data set. 
end
    xlT(numDataSet)=dataSetsSize+remain;
    
init_mc=initiate_mc(num_phases,aij);
init_hmm = HMM(init_mc ,P);   % intial hmm
hmm = train(init_hmm,data,xlT);
probability= logprob(hmm,data);
end