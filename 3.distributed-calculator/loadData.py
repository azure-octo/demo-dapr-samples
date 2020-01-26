import requests

numRequests = 1000

print("Loading Persist")
for i in range(0, numRequests):
    daprUrl = f"http://40.91.95.47/persist"
    content = [{"key": "calculatorState", "value": {"total": "null", "next": "9", "operation": "null"}}]

    header={"Content-Type":"application/json"}

    requests.post(daprUrl, json=content, headers={"Content-Type":"application/json"})

print("Loading Add")
for i in range(0, numRequests):
    daprUrl = f"http://40.91.95.47/calculate/add"
    content = {"operandOne": "9", "operandTwo": "3"}

    header={"Content-Type":"application/json"}

    requests.post(daprUrl, json=content, headers={"Content-Type":"application/json"})

print("Loading Subtract")
for i in range(0, numRequests):
    daprUrl = f"http://40.91.95.47/calculate/subtract"
    content = {"operandOne": "9", "operandTwo": "3"}

    header={"Content-Type":"application/json"}

    requests.post(daprUrl, json=content, headers={"Content-Type":"application/json"})

print("Loading Multiply")
for i in range(0, numRequests):
    daprUrl = f"http://40.91.95.47/calculate/multiply"
    content = {"operandOne": "9", "operandTwo": "3"}

    header={"Content-Type":"application/json"}

    requests.post(daprUrl, json=content, headers={"Content-Type":"application/json"})

print("Loading Divide")
for i in range(0, numRequests):
    daprUrl = f"http://40.91.95.47/calculate/divide"
    content = {"operandOne": "9", "operandTwo": "3"}

    header={"Content-Type":"application/json"}

    requests.post(daprUrl, json=content, headers={"Content-Type":"application/json"})