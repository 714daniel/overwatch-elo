function [team_list] = ELO(games_list, team_list)

for i = 1:247
    if (get_team_index(games_list(i).home, team_list) > 0 & get_team_index(games_list(i).away, team_list) > 0)
    %game = [games_list(i).outcome, games_list(i).home, games_list(i).away]
    %game(1)
    if games_list(i).outcome == "HOME"
        winner = games_list(i).home;
        loser = games_list(i).away;
    elseif games_list(i).outcome == "AWAY"
        winner = games_list(i).away;
        loser = games_list(i).home;
    end
    
    winnersindex = get_team_index(winner, team_list);   
    losersindex = get_team_index(loser, team_list);
    winnersELO = team_list(winnersindex).elo;
    losersELO = team_list(losersindex).elo;
        
   
    
    Kvalue = 32;
    
    %%calculating winners expected score
    
    temp = (winnersELO - losersELO)/400;
    expectedwinnerscore = 1/(1 + (10 ^ temp));
    
    %% calculating losers expected score
    temploser = (losersELO - winnersELO)/400;
    expectedloserscore = 1/(1+(10 ^ temploser));
    
    
    %%calcualting adjustment
    
    newELOWinner = winnersELO + Kvalue*(1 - expectedwinnerscore);
    
    newELOLoser = losersELO + Kvalue*(0 - expectedloserscore);
    
    team_list(winnersindex).elo = newELOWinner;
    
    team_list(losersindex).elo = newELOLoser;
    
    
    
    
            
    

    
    end
end

end

