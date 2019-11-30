clc, clear all, close all;
fname = 'overwatch.json';
val = jsondecode(fileread(fname));
twenty18 = val.league.seasons(2).games; % this is all of the 2018 data
games_2019 = val.league.seasons(1).games;

game.away = '';
game.home = '';
game.outcome = '';
games.odds_home = 0;
games.odds_away = 0;

team.name = '';
team.elo = 0;


team_list = repmat(team, 1,12);
games_list = repmat(game, 1,247);
team_list_2 = repmat(team, 1, 313);
games_list_2 = repmat(game, 1, 313);
team_list_index = 1;

for i = 1:313
    games_list_2(i).away =  games_2019(i).team_away;
    games_list_2(i).home = games_2019(i).team_home;
    games_list_2(i).outcome = games_2019(i).outcome;
    games_list_2(i).odds_home = games_2019(i).odds_home;
    games_list_2(i).odds_away = games_2019(i).odds_draw;
end

for i = 1:247
    games_list(i);
    games_list(i).away =  twenty18(i).team_away;
    games_list(i).home = twenty18(i).team_home;
    games_list(i).outcome = twenty18(i).outcome;
    games_list(i).odds_home = twenty18(i).odds_home;
    games_list(i).odds_away = twenty18(i).odds_draw;
    %team_list(i)
    
    if(get_team_index(games_list(i).away, team_list) == 0)
        team_list(team_list_index).name = games_list(i).away;
        team_list(team_list_index).elo = 2000;
        team_list_index = team_list_index + 1;
    end
    
     if(get_team_index(games_list(i).home, team_list) == 0)
        team_list(team_list_index).name = games_list(i).home;
        team_list(team_list_index).elo = 2000;
        team_list_index = team_list_index + 1;
     end
    
     
    
end

team_list = ELO(games_list, team_list);

for i = 1:5
    if(get_team_index(games_list_2(i).home, team_list) > 0 & get_team_index(games_list_2(i).away, team_list) > 0)
        %games_list_2(i).odds_home
        %games_list_2(i).odds_away
        %str2num(games_list_2(i).odds_away)
        percent_odds_home = convertOddsToPercentage(games_list_2(i).odds_home)
        percent_odds_away = convertOddsToPercentage(games_list_2(i).odds_away)
        predict_game(team_list, games_list_2(i).home, games_list_2(i).away, percent_odds_home, percent_odds_away);
    end
end