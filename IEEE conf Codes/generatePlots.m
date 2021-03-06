% this function is to generate plots.

function ...
    generatePlots(intersectionName, percentage,time,training_data,...
    realPhases, inferredStateSequence, range)

sizeOfData= size (realPhases, 2);

if range> sizeOfData
   
    error ('range is too big, please consier smaller range for plotting.')
    
else
    
figure
bar(percentage);
ylim([0 100]);
set(gca,'XTick',1:1:12);
set(gca,'XTickLabel',{'SBL', 'SBT', 'SBR', 'WBR', 'WBL', 'WBT', 'NBT', 'NBR', 'NBL', 'EBL', 'EBT', 'EBR'});
title(intersectionName);
ylabel('%')

figure
plot(time(1:range),training_data (1:range),'*', 'markersize', 5);
title(intersectionName);
set(gca,'YTick',1:1:12);
set(gca,'YTickLabel',{'SBL', 'SBT', 'SBR', 'WBR', 'WBL', 'WBT', 'NBT', 'NBR', 'NBL', 'EBL', 'EBT', 'EBR'});

   %x = 1:range;
   indCORRECT = realPhases(1:range)== inferredStateSequence(1:range);
   indINCORRECT = realPhases(1:range)~= inferredStateSequence(1:range);

figure
 
    plot(time(1:range) ,realPhases(1:range), 'x', 'markersize',6, 'MarkerEdgeColor','b');
    title(intersectionName);
    hold on
    plot(time(indCORRECT), inferredStateSequence(indCORRECT), 's', 'markersize',6, 'MarkerEdgeColor','g');
    plot(time(indINCORRECT), inferredStateSequence(indINCORRECT), 'o', 'markersize',6, 'MarkerEdgeColor','r');
    legend('Real', 'Correctly estimated', 'Wrongly estimated');
    set(gca,'YTick',1:1:7);
    set(gca,'YTickLabel',{'Phase1', 'Phase2', 'Phase3', 'Phase4', 'Phase5', 'Phase6', 'Phase7'});
    xlabel('Time(sec)')
    ylabel('Phase')
   
end
    
  