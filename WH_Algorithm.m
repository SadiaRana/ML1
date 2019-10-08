clear all;
k=1;
ro=0.1;

a = [1; 0; 0];
b = [1,7,7,3,8,6,1,7,7,3,8,6];
y=[1 1 1 -1 -1 -1 1 1 1 -1 -1 -1; 0 1 2 -3 -2 -3 0 1 2 -3 -2 -3; 2 2 1 1 -1 -2 2 2 1 1 -1 -2];
T1='Y x a=';
T2='new a';
T3='test3';
T4='test4';
C1='crucial';
S='k is';

while k<13
    
    disp(k);
    Y_a= a.'*y(:,k);
    disp(T1);
    disp(Y_a);
    a = a + ro*(b(1,k)-Y_a)*y(:,k);
    disp(T2);
    disp(a);
    k=k+1;
    
end
