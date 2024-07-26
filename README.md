# Kobo Notes Uploader

This is a badly-written script that uploads your screenshots to your Telegram Bot.

This script **NEEDS**  [NickelMenu](https://github.com/pgaskin/NickelMenu) to work.

1. Extract the [zip](https://github.com/luke-gto/kobo-screenshot-uploader/releases/) zip to the **root** folder of your Kobo

2. Create a Telegram bot with [Bot Father](https://t.me/BotFather).

3. Copy and paste  the TOKEN in 

   ```.adds/notes-upload/telegram.config```
	
4. Copy and paste your Telegram Chat ID (you can get it with [this bot](https://t.me/getmyid_bot)) in

   ```.adds/notes-upload/telegram.config```
	
5.Set the highlight export options by following steps:
    -connect kobo to your device  
    -open a file browser and navigate to the mounted kobo folder  
    -navigate to the hidden folder .kobo/Kobo  
    -open the file Kobo eReader.conf  
    -navigate to the section [FeatureSettings], if it doesn't exist, create it.  
    -add the line ExportHighlights=true and save  
    -disconnect the device  

6. Now you can long press on a book and export the note file into a .txt file which will be saved alongside your books. to get it connect your ereader.
7. Open the NickelMenu and you should see the "send_notes" option. Tap on it in order to send your exported notes txt file. Remember to have an internet connection ;) 

