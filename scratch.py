def prime_or_not(num):
    if num < 2: return 'Not prime'
    if num == 2: return 'Prime'
    power = pow(2, num - 1)
    if power % num == 1:
        return 'Prime'
    else:
        return 'Not prime'




print(prime_or_not(7))
