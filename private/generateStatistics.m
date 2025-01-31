function generateStatistics(s)
 %Get path to statistics
 p = which('HexComb');
 p = p(1:end-13); % Removes HexComb.mlapp
 p = [p 'private\'];

 %Import data
 opts = spreadsheetImportOptions("NumVariables",3);
 opts.VariableNames = ["Date","Game","Score"];
 opts.VariableTypes = ["datetime","double","double"];
 stats = readtable([p 'hexCombStatistics.xlsx'],opts);
 date = stats.Date;
 game = stats.Game;
 
 %Update the data in the table
 if isnat(date)
   newDate = datetime("today");
   newGame = 1;
   newScore = s;
   newStats = table(newDate,newGame,newScore,...
     'VariableNames',{'Date','Game','Score'});
   writetable(newStats,[p 'hexCombStatistics.xlsx']);
   return
 else
   newDate = datetime("today");
   newGame = max(game)+1;
   newScore = s;
   newStats = table(newDate,newGame,newScore,...
     'VariableNames',{'Date','Game','Score'});
   newStats = [stats;newStats];
   newStats = rmmissing(newStats);
   writetable(newStats,[p 'hexCombStatistics.xlsx']);
 end

end

%Copyright 2025 Austin M. Weber