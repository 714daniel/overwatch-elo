function [updatedteamlist] = ELO(games_list, team_list)

for i = 1:247
    
    %game = [games_list(i).outcome, games_list(i).home, games_list(i).away]
    %game(1)
    if games_list(i).outcome == "HOME"
        winner = games_list(i).home;
        loser = games_list(i).away;
    elseif games_list(i).outcome == "AWAY"
        winner = games_list(i).away;
        loser = games_list(i).home;
    end
    
    
    for j = 1:12
        if strcmp(team_list(j).name, winner)
            winnersELO = team_list(j).elo;
            winnersindex = j;
            break;
        else
            continue;
            
        end
    end
    
    for k = 1:12
        
        
        if strcmp(team_list(k).name, loser)
            losersindex = k;
            losersELO = team_list(k).elo;
            
            break;
            
        else
            continue;
            
        end
        
        
        
        
    end
   
    
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

