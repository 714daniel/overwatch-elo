function [outputArg1,outputArg2] = predict_game(team_list, team_1, team_2, team_1_odds, team_2_odds)
%PREDICT_GAME Summary of this function goes here
%   Detailed explanation goes here
 team_1_index = get_team_index(team_1, team_list);
 team_2_index = get_team_index(team_2, team_list);
 team_1_ELO = team_list(team_1_index).elo;
 team_2_ELO = team_list(team_2_index).elo;
 
  Kvalue = 32;
    
 %%calculating winners expected score
    
    temp = (team_1_ELO - team_2_ELO)/400;
    expected_team_1_score = 1/(1 + (10 ^ temp));
    
    %% calculating losers expected score
    temploser = (team_2_ELO - team_1_ELO)/400;
    expected_team_2_score = 1/(1+(10 ^ temploser));
    
    fprintf("%s HAS ODDS OF %f AND EXPECTED OUTCOME OF %f \n",team_1, team_1_odds,  expected_team_1_score);
    fprintf("%s HAS ODDS OF %f AND EXPECTED OUTCOME OF %f \n",team_2,team_2_odds,  expected_team_2_score);
end

