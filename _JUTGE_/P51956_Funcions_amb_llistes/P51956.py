def myLength (list):
    result = 0
    for i in list:
        result += 1
    return result

def myMaximum (list):
    max_val = list[0]
    for i in list[1:]:
        if max_val < i:
            max_val = i
    return max_val

def average (list):
    return float(sum(list)) / float(myLength(list))

def buildPalindrome (mlist):
    return list(mlist.reverse()).append(list)

def remove (list1, list2):
    for l in list2:
        while l in list1:
            list1.remove(l)
    return list1
