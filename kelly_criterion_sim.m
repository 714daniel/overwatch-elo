function [percentage] = kelly_criterion_sim(bet_odds, win_prob)
bet_odds = 1 / bet_odds;
percentage = (win_prob * (bet_odds + 1) - 1) / bet_odds;
end

