#!/bin/bash
export | grep OPENAI
eval "$(conda shell.bash hook)"
conda activate chatdev;
clear

# SET NAME of CHATDEV-APP
chatorg="SCALAR-CHATDEV"
chatapp="idp"

## SETTINGS Berlin clock
##chatapp="berlin-app"

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
        # BUILD APP
        clear;
        echo "=== BUILD SOLUTION ==";
        conda create -n  $chatapp python==3.9 -y;
        conda activate chatdev;
        pip install -r requirements.txt;

        #DISABLED FOR TESTING NEXT STEPS
        #Berlin Clock
        # Berlin clock app
        #python run.py --org $chatorg --name $chatapp --task "Create an clock app that displays the time and set an time alarm and plays a sound when the alarm is triggered. show documentation on how to use it and be able to run this app as a docker container."

        # IDP
        python run.py --org $chatorg --name $chatapp --task "Create an idp api app with frontend web-page manages a gitlab environment where a developer can approve or block users. create users groups and projects and assign or remove users and groups to a project. also it set some default variables for gitlab and projects based on a settings.json file";

        echo "";
        echo "=== END BUILD ===";;

	[2] )
        # REVIEW BUILT APP
        clear;
        echo "=== VIEW REVIEW APP ===";
        #DISABLED FOR TESTING NEXT STEPS
        python online_log/app.py;
        echo "";
        echo "=== END REVIEW ===";;

    [3] )
        # RUN BUILT APP
        clear;
        echo "=== RUN APP ===";
        appPath=$(pwd);
        cd $(ls -d $appPath/WareHouse/$chatapp'_'$chatorg'_'* | fzf --header "Select");
#        conda activate $chatapp;
        #if [ -f requirements.txt ]; 
        pip install -r requirements.txt;
        python main.py;
#        conda deactivate
        cd $appPath;
        echo "=== END RUN ===";;

	[aA] )
        # Activate conda environment
        clear;
        conda activate $(conda env list | cut -d " " -f 1 | fzf --header "Select");;

	[dD] )
        # deactivate conda environment
        clear;
		conda deactivate;
        conda info | grep "active environment" | cut -d ":" -f 2;;

    [vV] )
        # Display version info
        clear;
        export | grep conda;
		conda -V;
        conda info | grep -E 'version|environ';
        python --version;
        pip --version;
        read -t 5 -n 1;;
    [qQxX] )
        # Exit/Quit runner
        clear;
		exit;;

	* )
        clear;;
esac
done
conda remove -n $chatapp --all --yes;
echo DONE!
