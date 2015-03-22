def print_stat(frame, bp_loc, dict):
    
    index = frame.FindVariable("i")
    stat = frame.FindVariable("stat")
    stat_name = ""

    counter = index.GetValueAsUnsigned(0)
    statValue = stat.GetValueAsUnsigned(0)
    
    if counter == 0:
        stat_name = "Stength"
    elif counter == 1:
        stat_name = "Intellignce"
    elif counter == 2:
        stat_name = "Dexterity"
    elif counter == 3:
        stat_name = "Charisma"
    elif counter == 4:
        stat_name = "Endurance"
    elif counter == 5:
        stat_name = "Luck"

    print stat_name + " is " + str(statValue)

    return False


