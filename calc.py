num1 = float(input("Enter the first number: "))
num2 = float(input("Enter the second number: "))
opType = input("Enter operation (+, -, *, /): ")

match opType:
	case '+':
		result = num1 + num2
		print("Result: ", result)
	case '-':
		result = num1 - num2
		print("Result: ", result)
	case '*':
		result = num1 * num2
		print("Result: ", result)
	case '/':
		if num2 != 0:
			result = num1 / num2
			print("Result: ", result)
		else:
			print("Error: cannot divide by zero.")
	case _:
		print("Invalid Operation.")