function [i] = get_team_index(team_name, team_list)
for i = 1:13
    team_list(i).name
    team_name
    %team_list(i).name == team_name
    strcmp(team_list(i).name, team_name)
    if(strcmp(team_list(i).name, team_name))
        return
    end
end

i = 0;
end

