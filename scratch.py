class Calculator():
    def divisorSum(self, n):
        sum = 0
        for i in range(1, 6):
            if n % i == 0:
                sum += i
                print(sum)
            else:
                pass
        return sum


cal = Calculator()
print(cal.divisorSum(6))
