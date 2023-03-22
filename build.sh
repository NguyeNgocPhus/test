#!/usr/bin/env bash
echo "hellllllllllllllllllllo"
helpFunction(){
  echo ""
  echo "Usage: $0 -e Environment -s Services -v Version -h Help"
  echo ""
  echo "Parameters & Options:"
  echo -e "\t-e ASPNETCORE_ENVIRONMENT, default is development. E.g development, production"
  echo -e "\t-s Microservice name to be built or 'all'"
  echo -e "\t-v Container version"
  echo -e "\t-h Help"
  echo -e "Example:"
  echo -e "\t./build-business-services.sh -e production -s identity -v 1.0"
}
while getopts "e:s:v:t:h" opt
do
  # shellcheck disable=SC2220
  case "$opt" in
    e) env="$OPTARG" ;;
    s) service="$OPTARG" ;;
    v) version="$OPTARG" ;;
    t) ext="$OPTARG";;
    h) helpFunction ;;
  esac
done


docker-compose -f docker-compose.yml build --no-cache
docker-compose -f docker-compose.yml up -d

echo $env
echo $service
echo $version
echo $ext

read -n1 -p "Press any key to exit."
exit