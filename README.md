# project mobile 

A new Flutter project.

## Getting Started

To activate the application you need to activate the local serveur first you can contact us to launch the serveur
Or you can do it manually 

1/ dowload the requirements using pip command in pyhton 

2/ launch uvicorn the internal serveur using the command "python uvicorn main:app --reload" ( if there is an error maybe because 

of the python version try "python -m uvicorn main:app --reload") you must be in the same directory as main.py

3/ Now you have the serveur is working you can use the address that you got from uvicorn (usally it is 127.0.0.1:8000 or localhost:8000)
or you can use other method to create public adress as ngrok for exemple.

4/ Copy the address and past it in flutter in the file lib/api/auth in the variable "serverurl"
Now you can open the application and test it 
