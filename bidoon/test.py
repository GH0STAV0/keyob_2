#
from pyvirtualdisplay import Display
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options as options
from selenium.webdriver.firefox.options import Options as Firefox_Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import random,datetime,string , os ,time ,subprocess , sys

#os.environ['DISPLAY'] = ':0'


def get_firefox_profile_dir():
    if sys.platform in ['linux', 'linux2']:
        import subprocess
        cmd = "ls -d /root/.mozilla/firefox/*.default/"
        p = subprocess.Popen([cmd], shell=True, stdout=subprocess.PIPE)
        FF_PRF_DIR = p.communicate()[0][0:-2]
        FF_PRF_DIR_DEFAULT = str(FF_PRF_DIR,'utf-8')
    elif sys.platform == 'win32':
        import os
        import glob
        APPDATA = os.getenv('APPDATA')
        FF_PRF_DIR = "%s\\Mozilla\\Firefox\\Profiles\\" % APPDATA
        PATTERN = FF_PRF_DIR + "*default*"
        FF_PRF_DIR_DEFAULT = glob.glob(PATTERN)[0]
 
    return FF_PRF_DIR_DEFAULT

profile_name=get_firefox_profile_dir()
print(profile_name)

firefox_options = Firefox_Options()
firefox_options.binary = "/root/EXTRAT/firefox/firefox";

url_booyah='https://determined-ptolemy-83a410.netlify.app/'
firefox_options.add_argument("--headless")

def build_driver():

	driver = webdriver.Firefox(executable_path='/usr/bin/geckodriver13' ,options=firefox_options)
  #	driver = webdriver.Firefox(executable_path='/usr/bin/geckodriver13', firefox_profile=profile_name ,options=firefox_options)
	driver.maximize_window()
	return driver






def starter():
	try:
		#l0g(" [ ok ] ")
		display = Display(visible=1, size=(1024, 1024))
		display.start()
		init_fire()
		driver=build_driver()
		driver.get(url_booyah)
		#driver.maximize_window()
		check_web(driver)

	except:
		print("something wrong")
		driver.quit()
		starter()

		#driver.refresh()
		#eto_firstName=WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.primary-button.primary-button-blue')))
		#by_by(driver)

def check_web(driver):
	try:
		print("web page CHECK .....")
		eto_firstName=WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.ID, 'root')))
#		eto_firstName.send_keys(Keys.F11)
		#eto_firstName.click()
		print("web page working sleep 10")
		time.sleep(2)
		check_web(driver)

	except:
		print("something wrong")
		driver.quit()
		starter()

def init_fire():
	try:
		os.system("pkill firefox")
	except:
		print("some_error")





init_fire()
starter()

