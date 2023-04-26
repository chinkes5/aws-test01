#!/bin/bash

command=i
while [ $command != "q" ]
do
    read -r -p "Enter Terraform Command- i, v, f, p, a, d, or q: " command
    case $command in
        "i" )
            terraform init -upgrade;;
        "v" )
            echo "*****************************************"
            echo "*    validating what you got so far     *"
            echo "*****************************************"
            terraform validate;;
        "f" )
            echo "Formatting all files and sub-folders..."
            terraform fmt -recursive;;
        "p" )
            tfvarFiles='./*.tfvars'
            for eachfile in $tfvarFiles
            do
                read -r -p "Use this file- $eachfile: [yN]" fileOK
                if [ $fileOK = 'y' ]; then
                    terraform plan -var-file=$eachfile --out=./plan.out
                    continue
                fi
            done
            echo "No TFVAR file selected, just running a plan..."
            terraform plan --out=./plan.out;;
        "a" )
            if test -f "./plan.out"; then
                echo "*****************************************"
                terraform apply "./plan.out"
            else
                echo "No plan file, run plan first!"
            fi;;
        "d" )
            echo "*****************************************"
            read -r -p "Ready to destroy [yN] " destroy
            if [ $destroy = 'y' ]; then
                terraform destroy --auto-approve
                rm ./plan.out
            else
                echo "Not ready, no destroy!"
            fi;;
        "q" )
            echo "All done!"
            exit 0;;
        * ) 
            echo "the choices are 'Initialize', 'Validate', 'Plan', 'Apply', 'Destroy', or 'Quit'..." ;;
    esac
done

