clc, clear all, close all;
fname = 'overwatch.json';
val = jsondecode(fileread(fname));
twenty19 = val.league.seasons(1).games; %this is all of the 2019 data
twenty18 = val.league.seasons(2).games; % this is all of the 2018 data
games2018 =cell(5, 247);
teams2018 = array(2,247);

for i = 1:247
games2018{1,i} = twenty18(i).team_home;
games2018{2,i} = twenty18(i).team_away;
games2018{3,i} = twenty18(i).outcome;
teams2018(1,i) = twenty18(i).team_home;

end
uniqteams = unique(teams2018); %trying to get a list of teams