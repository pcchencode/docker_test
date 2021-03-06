# https://towardsdatascience.com/how-to-setup-selenium-on-a-linux-vm-cd19ee47d922
# chrome browser version of Ubuntu: https://www.ubuntuupdates.org/pm/google-chrome-stable
# chrome driver version: https://chromedriver.chromium.org/downloads
## driver 與 browser 的基本版本號要一樣 selenium 才能運行
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

CHROMEDRIVER_PATH = '/usr/local/bin/chromedriver'
WINDOW_SIZE = "1920,1080"

chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--window-size=%s" % WINDOW_SIZE)
chrome_options.add_argument('--no-sandbox')

driver = webdriver.Chrome(executable_path=CHROMEDRIVER_PATH,
                          chrome_options=chrome_options
                         )
driver.get("https://www.google.com")
print(driver.title)
driver.close()