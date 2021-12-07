If ((Read-Host "Ready to start [y/n]") -eq "y") {
    terraform init

    do {
        $response = Read-Host “Press I, P, A, D, or Q”
        switch ($response) {
            "p" {
                Write-Output "Running plan..."
                terraform plan -out plan.out
            }
            "a" {
                Write-Output "Applying plan..."
                terraform apply "plan.out"
            }
            "d" {
                Write-Output "Planning destroy..."
                terraform plan -out plan.out -destroy
                if((Read-Host "ready to destroy [y/n]") -eq "y"){
                    Write-Output "Destroying..."
                    terraform apply "plan.out"
                }
            }
            "q"{
                Write-Output "All done!"
                break
            }
            Default {
                Write-Output "Didn't undestand that, please try again"
                Write-Output "P = plan`nA = apply`nD = destroy (with verification)`nQ = quit"
            }
        }
    } until ($response -eq "q")
}  
else {
    Write-Output "Not ready, quitting script"
}
