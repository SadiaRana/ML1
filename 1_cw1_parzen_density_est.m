clear all;
%Illustrates parzen density estimation. Employs data generated using a
%combination of two univariate Gaussian distributions. The distribution of the data is
%estimated using more and more data points.
k=0;
for N=[10,50,100,500,1000,5000]
  k=k+1;
  
  %-----------------------------CREATE DATA------------------------
  %N = Number of samples taken from each Gaussian
  mu1 = 0; % Mean for first Gaussian
  mu2 = 2; % Mean for second Gaussian
  sigma1 = 0.5; % StDev for first Gaussian
  sigma2 = 1; % StDev for second Gaussian
  r=-1.5:0.01:3.5; % Spread - the range of values for which we want to calc density
  %calculate the true distribution for all r values:
  pdf1 = normpdf(r,mu1,sigma1); 
  pdf2 = normpdf(r,mu2,sigma2); 
  pdf = 0.5*pdf1 + 0.5*pdf2; % Combine gaussians to make bimodal distribution
  
  %--------------------------Plot actual bimodal distribution:
  figure(k);clf; plot(r,pdf,'r-','linewidth',3); hold on
  %get samples from the probability distribution:
  d1 = normrnd(mu1,sigma1,1,N); 
  d2 = normrnd(mu2,sigma2,1,N); 
  d = [d1 d2]; % Combine data samples from both Gaussian distributions
   
  %ESTIMATE DATA DISTRIBUTION
  p = ksdensity(d,r); % Apply Parzen window density estimation
 
  %------------------------PLOT------------------------------------------------
  plot(r,p,'linewidth',3);grid % Plot Parzen Window estimate
  xlabel('x','fontsize',16); % Label axes
  ylabel('p(x)','fontsize',16); % Label axes
  title(['Parzen Window Estimated Distribution for N = ',num2str(N)],'fontsize',16);hold on;
  legend('Known Distribution','Parzen Window Estimate')
end
