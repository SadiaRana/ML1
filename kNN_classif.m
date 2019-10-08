% Using the same dataset (d1, d2, and d3) and the same new samples (-2,0,2,4,6,8,10) as used in
% Part 1, determine the class of each of the new samples using the k-nearest neighbours classifier
% (kNN), both for k=1 and k=5. Use the euclidean distance between the values as your measure of
% similarity.
% You can do this manually, but it is laborious. It is easier to write some simple code to do this for
% you. MATLAB provides inbuilt functions for kNN (see ?fitcknn? or ?knnclassify?) or you may wish
% to write your own code (in which case you may find the function ?sort? useful!).


clear all;

%-----------------Initialising -------------------

load 1_iris_class1_2_3_4D.mat
X=X.';
t=t.';

Xtest=[1,7,7,3,8,6,9; 7,7,3,8,6,9,1; 7,3,8,6,9,1,7; 3,8,6,9,1,7,7,];
Xtest=bsxfun(@rdivide,Xtest,[2.3;4;1.5;4]);
Xtest=bsxfun(@plus,Xtest,[4;2;1;0]);
Xtest=Xtest.';

%disp(Xtest);

% d1=[-3.34,0.11,1.07,0.82,-0.51,-1.24,1.15,1.29,-3.38,-1.12,1.35,-0.14,1.21,-2.11,0.48,2.16,0.91,- 0.78,1.13,1.32 ];
% d2=[3.27,4.57,4.12,4.99,4.40,4.08,5.96,3.37,4.0,3.56,4.81,3.02,3.01,2.62,3.77,7.01,2.84,2.79,4.41,2. 08,6.66,6.65,4.65,5.78,5.81,5.65,3.73,4.31,4.84,3.70,4.73,2.98,3.95,3.58];
% d3=[3.66,6.16,10.07,6.43,7.17,8.17,7.33,6.24,7.02,6.52,7.27,7.86,9.27,11.58,5.12,10.12,9.07,11.57, 9.12,9.88,6.71,8.18,9.29,6.56,10.40,7.39,8.30,8.77,8.66,7.78,10.00,6.14,8.74];
% 
% numd1=numel(d1);
% numd2=numel(d2);
% numd3=numel(d3);

%---------------creating data table--------------

% A= [d1 d2 d3];
% X=A.';
% 
% v1 = ["d1"];
% u1= repelem(v1,numd1);
% v2 = ["d2"];
% u2= repelem(v2,numd2);
% v3 = ["d3"];
% u3= repelem(v3,numd3);
% B= [u1 u2 u3];
% Y=B.';
% 
% T=table(X,Y);

%disp(T)
%disp(size(Y))
%T.Properties.VariableNames = {'d', 'Y' };

%---------------getting kNN classification ------------

Mdl = fitcknn(X,t,'Distance','euclidean','NumNeighbors',3,'Standardize',1);

%disp(Mdl.ClassNames);

%(-2,0,2,4,6,8,10)
A= predict(Mdl, Xtest);

disp(A)

% post_1 = (ksdensity(d1,r)*p_w1); % Apply Parzen window density estimation
% post_2 = (ksdensity(d2,r)*p_w2); 
% post_3 = (ksdensity(d3,r)*p_w3);

