#230626_133005_주유소

city = input()
length = input().split(" ")
price = input().split(" ")

length = [int(length[index]) for index in range(len(length))]
price = [int(price[index]) for index in range(len(price))]

answer = 0
for index in range(len(price)):
    
    if index == len(price) - 1:
        break
    if price[index] < price[index + 1]:
        price[index + 1] = price[index]
    
    answer += price[index] * length[index]

print(answer)
