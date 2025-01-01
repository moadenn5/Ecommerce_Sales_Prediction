
import pywhatkit
import time
import subprocess

def sleep_computer():
    subprocess.run(['rundll32.exe', 'powrprof.dll,SetSuspendState', '0,1,0'], shell=True)

hour = 6
minute = 00

pywhatkit.sendwhatmsg("+15148218794", "cc La meilleur💖. À l’aube de cette nouvelle année. Mon vœu le plus cher est que cette année sera celle qui comblera la distance entre nous. Happy New Year, the best Kawtar! Je te souhaite une excellente année à venir inchaallah , remplie de santé, de prospérité pour toi et ta famille. Que 2025 t'apporte tout ce que tu désires ! 💕", hour, minute)

time.sleep(20)

sleep_computer()