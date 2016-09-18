# NS-Likar
## Karaoke for linux

It is just a bash script, thats redirect sound from microphone to speakers, and allows adjust microphone volume by arrow keys. 

## Usage
Find microphone (line-in) source index.
````
pactl list sources
````

Run script passind index as argument
````
>./nslikar.sh 2
````

Press any key for sound clear.

- Up and Down arrows allow ajust microphone volume
- Enter - exit.

## Requirements
Your system should use pulse audio.
