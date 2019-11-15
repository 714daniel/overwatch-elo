clc, clear all, close all;
fname = 'overwatch.json';
val = jsondecode(fileread(fname));
twenty19 = val.league.seasons(1).games; %this is all of the 2019 data
twenty18 = val.league.seasons(2).games; % this is all of the 2018 data
games2018 = cell(5, 247);
teams2018 = cell(3,247);

for i = 1:247
games2018{1,i} = twenty18(i).team_home
games2018{2,i} = twenty18(i).team_away;
games2018{3,i} = twenty18(i).outcome;
teams2018{1,i} = twenty18(i).team_home;
teams2018{2,i} = twenty18(i).team_away;

end

uniqteams = unique(cellfun(@num2str,teams2018,'uni',0)); %getting unique teams

%setting starting ELO score of 1000
%teammap = containers.map;
startingscore = NaN(1,12);
for i =2:length(uniqteams)
   uniqteams{i,2} = 1000;
   startingscore(i) = 1000;
    
end
%steammap = containers.Map(uniqteams{2:end,1}, startingscore);