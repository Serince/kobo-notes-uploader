notes_path="/mnt/onboard/"

SCRIPT=$(readlink -f $0)

SCRIPTPATH=$(dirname "$SCRIPT")

source $SCRIPTPATH/telegram.config

if [ -z "${TELEGRAM_BOT_TOKEN}" ] ||  [ -z "${CHAT_ID}" ];

    then

        echo "Invalid Telegram credentials, sorry."
        exit

fi

qndb -t 6000 -m wfmConnectWirelessSilently
OIFS="$IFS"
IFS=$'\n'
if ! [ "$(ping -c1 8.8.8.8)" ]

    then

        echo "error! no connection detected"
        exit

    else


        files=$(/usr/bin/find $notes_path -maxdepth 2 -type f -name "*.txt")

        if [ -z "${files}" ];

            then

                echo "No notes found, sorry."

            else

                for i in $files;


                do
                    textmessage="$(cat $i)"

                    if $SCRIPTPATH/curl -k https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage -F chat_id=$CHAT_ID -F text=$textmessage | grep -q 'error';

                        then

                            echo "Generic erorr! Please check Telegram credentials and internet connection."

                        else

                            #./bin/rm $i
                            qndb -m wfmSetAirplaneMode --disable
                            qndb -m mwcToast 3000 "Notes and highlights successfully sent. Wi-Fi turned off."
                    fi

                done

        fi


fi
IFS="$OIFS"
