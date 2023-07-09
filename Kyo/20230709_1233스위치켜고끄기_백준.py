## 20230709_1233스위치켜고끄기_백준
## Input
switchCount = int(input())
switch = input().split(" ")
switch = [int(number) for number in switch]

switch.insert(0, -1)
testcase = int(input())

# Function
def changeSwitchMen(number):
    for index in range(switchCount + 1):
        if index % number == 0:
            if switch[index] == 0:
                switch[index] = 1 
            elif switch[index] == 1:
                switch[index] = 0
    return

def changeSwitchWoMen(number):
    changeTarget = set()     # Set
    start = number
    end = number
    
    while switch[start] == switch[end]:
        changeTarget.add(start)
        changeTarget.add(end)
        start -= 1
        end += 1
        if start == 0 or end > switchCount:
            break
    
    for target in changeTarget:
        if switch[target] == 0:
            switch[target] = 1
        elif switch[target] == 1:
            switch[target] = 0
    
    return

for _ in range(testcase):
    caseInput = input().split(" ")
    caseInput = [int(number) for number in caseInput]
    
    gender = caseInput[0]
    number = caseInput[1]
    
    if gender == 1:
        changeSwitchMen(number)
    elif gender == 2:
        changeSwitchWoMen(number)
        
# Output
switch.pop(0) 
count = 1
for index in range(len(switch)):
    if (index != 20 * count) and int(index / 20) == count:
        print("")
        count += 1
    print(switch[index], end = " ")
