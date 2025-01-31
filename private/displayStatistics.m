function displayStatistics(scores,avgScore)
figure('Name','My Stats')
   histogram(scores,'NumBins',25);
   xlabel('Score')
   xtickformat('percentage')
   yl = ylim;
   yl_interval = floor(yl(2) / 5);
   if yl_interval < 1
     yl_interval = 1;
   end
   yticks(0:yl_interval:yl(2))
   lg = ['Average score = ' sprintf('%0.1f',avgScore)];
   legend(lg,'Location','northwest')
   set(gca,'FontSize',14)

%Copyright 2025 Austin M. Weber