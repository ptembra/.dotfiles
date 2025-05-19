clear
LOCATION="?"
echo "Welcome back, \033[0;36m$(whoami)\033[0m!"
echo "---"
echo "Today's date: \033[0;36m$(date +%d/%m/%Y)\033[0m"
echo "---"
# Custom uptime formatting
uptime_info=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
echo "System Uptime: \033[0;36m$uptime_info\033[0m"
echo "---"

# Weather retrival, display and caching logic
# ZWC stands for "ZSH Weather Cache"
ZWC_DIR="$HOME/.cache/zsh/weather"
TODAY="$(date +%Y-%m-%d)"
YESTERDAY="$(date -v -1d +%Y-%m-%d)"
ZWC_FILE="$ZWC_DIR/$TODAY.txt"

# Check if cache dir exists
if [ ! -d $ZSH_WEATHER_CACHE ]; then
  mkdir -p $ZSH_WEATHER_CACHE
fi

# Check if cache file exists and is up to date
if [[ ! -f $ZWC_FILE || $ZWC_FILE != "$ZWC_DIR/$TODAY.txt" ]]; then
  # Check internet connection
  if $(ping -q -W 1 -c 1 google.com > /dev/null); then
    if [ -f "$ZWC_DIR/$YESTERDAY.txt" ]; then
      rm "$ZWC_DIR/$YESTERDAY.txt"
    fi
    echo "Retrieving weather data..."
    curl --silent "wttr.in/$LOCATION?F2m" > "$ZWC_FILE"
  else
    echo "\033[0;31m No internet connection, weather data not retrieved.\033[0m"
    return
  fi
fi
echo "Today's and tommorow's weather:"

cat $ZWC_FILE

echo "\n"
