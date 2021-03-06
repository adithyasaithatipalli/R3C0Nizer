#!/bin/bash

#colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
reset=`tput sgr0`

read -p "Enter domain name : " DOM

if [ -d ~/reconizer/ ]
then
  echo " "
else
  mkdir ~/reconizer
fi

if [ -d ~/reconizer/tools ]
then
  echo " "
else
  mkdir ~/reconizer/tools 
fi

if [ -d ~/reconizer/$DOM ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM
fi

if [ -d ~/reconizer/$DOM/Subdomain_takeovers ]
then
  echo " "
else
  mkdir ~/reconizer/$DOM/Subdomain_takeovers
fi


echo "${red}
 =================================================
|   ____  _____  ____ ___  _   _ _                |
|  |  _ \|___ / / ___/ _ \| \ | (_)_______ _ __   |
|  | |_) | |_ \| |  | | | |  \| | |_  / _ \ '__|  |
|  |  _ < ___) | |__| |_| | |\  | |/ /  __/ |     |
|  |_| \_\____/ \____\___/|_| \_|_/___\___|_|     |
|                                                 |
 ================== Anon-Artist ==================
${reset}"
echo "${blue} [+] Started Subdomain Takeover Scanning ${reset}"
echo " "

#nuclei
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
if [ -f ~/go/bin/nuclei ]
then
  echo "${magenta} [+] Running nuclei ${reset}"
  nuclei -update-templates
  nuclei -l ~/reconizer/$DOM/Subdomains/unique.txt -t ~/nuclei-templates/subdomain-takeover/ -o ~/reconizer/$DOM/Subdomain_takeovers/takeover_results.txt
else
  echo "${blue} [+] Installing nuclei ${reset}"
  echo "${magenta} [+] Running nuclei ${reset}"
  go get -u github.com/projectdiscovery/nuclei/v2/cmd/nuclei
  nuclei -update-templates
  nuclei -l ~/reconizer/$DOM/Subdomains/unique.txt -t ~/nuclei-templates/subdomain-takeover/ -o ~/reconizer/$DOM/Subdomain_takeovers/takeover_results.txt
fi

echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo " "
echo "${red} [+] Thank you for using R3C0nizer${reset}"
echo ""
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
