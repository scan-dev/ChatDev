export | grep OPENAI
conda activate $(conda env list | fzf --header "Select ENV")
python --version
pip --version

echo ""
read -p "--> continue to BUILD" ask

echo "=== BUILD SOLUTION =="
chatapp="berlin-app" # SET NAME of CHATDEV-APP
chatorg="SCALAR-CHATDEV"

#DISABLED FOR TESTING NEXT STEPS
pip install -r requirements.txt
python run.py --org $chatorg --name $chatapp --task "Create an clock app that displays the time and set an time alarm and plays a sound when the alarm is triggered. show documentation on how to use it and be able to run this app as a docker container."
echo ""
echo "=== END BUILD ==="


read -p "continue REVIEW app" ask

echo "=== VIEW REVIEW APP ==="
#DISABLED FOR TESTING NEXT STEPS
#python online_log/app.py &&
echo ""
echo "=== END REVIEW ==="


read -p "continue RUN app" ask

echo "=== RUN APP ==="
appPath=$(pwd)
cd $(ls -d $appPath/WareHouse/$chatapp'_'$chatorg'_'* | fzf --header "Select")
conda create -n  $chatapp python==3.9 -y
conda activate $chatdev
pip install -r requirements.txt
python main.py
conda deactivate
conda remove -n $chatapp --all --yes
echo "=== END RUN ==="

echo DONE!
