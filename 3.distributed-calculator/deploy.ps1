Write-Host "---------------SWITCHING KUBECTL CONTEXT-----------------" -ForegroundColor White -BackgroundColor Black
kubectl config use-context AKS
Write-Host "---------------DEPLOYING REDIS BINDING-------------------" -ForegroundColor Black -BackgroundColor Blue
kubectl apply -f .\deploy\redis.yaml
Write-Host "---------------DEPLOYING REACT FRONTEND------------------" -ForegroundColor Black -BackgroundColor Blue
kubectl apply -f .\deploy\react-calculator.yaml
Write-Host "---------------DEPLOYING GO ADDER------------------------" -ForegroundColor Black -BackgroundColor Red
kubectl apply -f .\deploy\go-adder.yaml
Write-Host "---------------DEPLOYING C# SUBTRACTOR-------------------" -ForegroundColor Black -BackgroundColor Green
kubectl apply -f .\deploy\dotnet-subtractor.yaml
Write-Host "---------------DEPLOYING PYTHON MULTIPLIER---------------" -ForegroundColor Black -BackgroundColor Yellow
kubectl apply -f .\deploy\python-multiplier.yaml
Write-Host "---------------DEPLOYING NODE DIVIDER--------------------" -ForegroundColor Black -BackgroundColor White
kubectl apply -f .\deploy\node-divider.yaml
Write-Host "---------------DEPLOYING FORTRAN MODULO--------------------" -ForegroundColor Black -BackgroundColor Green
kubectl apply -f .\deploy\fortran-modulo.yaml