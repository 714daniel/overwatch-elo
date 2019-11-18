function [games_list, team_list] = ALGO_400(updatedteamlist)

for i = 1:247
    game = [games_list(i).outcome, games_list(i).home, games_list.away];
    if game(1) == "HOME":
        winner = game(2);
        loser = game(3);
    else
        winner = game(3);
        loser = game(2);
    end
    
    
    for 1 = 1:12
        if strcmp(team_list(i).name, winner)
            winnersELO = team_list(i).elo;
            winnersindex = i;
            break;
        else
            continue;
            
        end
        
        if strcmp(team_list(i).name, loser)
            losersindex = i;
            losersELO = team_list(i).elo;
            break;
            
        else
            continue;
            
        end
        
        
        
        
    end
    
    %newWinnersELO = (winnersELO 
    %newLosersELO = 
    
    
    
    
            
    

    
    
end

end

