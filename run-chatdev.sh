#!/bin/bash
export | grep OPENAI
clear

# SET NAME of CHATDEV-APP
chatorg="SCALAR-CHATDEV"

## SETTINGS Berlin clock
##chatapp="berlin-app"

## SETTINGS IDP
chatapp="idp"

#MAIN
while true; do

echo "chatDEV Runner"
echo "___________________"
echo ""
echo "1.  Build App"
echo "2.  Review App"
echo "3.  Run App"
echo ""
echo "options"
echo "<A>ctivate env"
echo "<D>eactivate env"
echo "<V>ersions"
echo ""
echo "<Q>uit"
echo current env active : $(conda info | grep "active environment" | cut -d ":" -f 2)
echo "==================="

read -p "Select option : " ask
case $ask in
	[1] )
        clear;
        echo 1. we will proceed;;
        echo "=== BUILD SOLUTION =="


        #DISABLED FOR TESTING NEXT STEPS
        pip install -r requirements.txt

        #Berlin Clock
        # Berlin clock app
        #python run.py --org $chatorg --name $chatapp --task "Create an clock app that displays the time and set an time alarm and plays a sound when the alarm is triggered. show documentation on how to use it and be able to run this app as a docker container."

        # IDP
        python run.py --org $chatorg --name $chatapp --task "an idp api app with frontend web-page manages a gitlab environment where a developer can approve or block users. create users groups and projects and assign or remove users and groups to a project. also it set some default variables for gitlab and projects based on a settings.json file"

        echo ""
        echo "=== END BUILD ==="

	[2] )
        clear;
        echo "=== VIEW REVIEW APP ===";
        #DISABLED FOR TESTING NEXT STEPS
        python online_log/app.py;
        echo "";
        echo "=== END REVIEW ===";;

    [3] )
        clear;
        echo "=== RUN APP ===";
        appPath=$(pwd);
        cd $(ls -d $appPath/WareHouse/$chatapp'_'$chatorg'_'* | fzf --header "Select");
        conda create -n  $chatapp python==3.9 -y;
        eval "$(conda shell.bash hook)";
        conda activate $chatapp;
        conda info | grep "active environment" | cut -d ":" -f 2;
        #pip install -r requirements.txt;
        python main.py;

        read -p "--> continue RUN" ask;
        conda deactivate;
        conda remove -n $chatapp --all --yes;
        echo "=== END RUN ===";;
	[aA] )
        clear;
        eval "$(conda shell.bash hook)";
        conda activate $(conda env list | cut -d " " -f 1 | fzf --header "Select");;

	[dD] )
        clear;
		conda deactivate;
        conda info | grep "active environment" | cut -d ":" -f 2;;

    [vV] )
        clear;
        export | grep conda;
		conda -V;
        conda info | grep -E 'version|environ';
        python --version;
        pip --version;
        read -t 5 -n 1;;
    [qQxX] )
        clear;
		exit;;

	* )
        clear;;
esac
done
exit

echo ""
read -p "--> continue to BUILD" ask


echo DONE!
