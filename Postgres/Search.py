import threading
import psycopg2
import time
# List shared between threads
lista_compartilhada = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,18,19,21,22]
lista_boa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,18,19,21,22]

#lista_compartilhada = [17,20]
#lista_boa = [17,20]


# Mutex to control access to the shared list
lock = threading.Lock()

# List to store threads
threads = []

# Set the desired number of threads
num_threads = 5

def Execute(numero, lista,n):
    print(f"Thread {numero} Started")
    while True:
        # Block access to the list to avoid race conditions
        with lock:
            # Check if the list is empty
            if not lista:
                break
           # Remove an element from the list

            elemento = lista.pop(0)
            query = "Query/" + str(elemento) + ".sql"
          
        print(f"Thread {numero} executing {query}")
       

        with open(query, 'r') as file:
            consulta = file.read()
            
    
        try: # MUDAR AQUI RUI
       # Configuring the connection to the database
            conn = psycopg2.connect(
            host="localhost",
            database="tpch-25",
            user="postgres",
            password="rpcs190202"
            )
           
            cursor = conn.cursor()
            inicio = time.time()
            cursor.execute(consulta)
            fim = time.time()
            tempo_execucao = fim - inicio
            result = "Thread " +  str(numero) + " -> Time to execute " + str(query) + " : " + str(tempo_execucao) + " seconds \n"
            SendToFile(result,n)
            
        except Exception as e:
            print("Error when executing queries:", e)

        print(f"Thread {numero} ready for the next query")
    print(f"Thread {numero} finished")

def SendToFile(Message,number):
    FileName = "Results/ExecuteTime"+str(number)+".txt"
  
    with open(FileName, 'a') as f:
            f.write(Message)





if __name__ == "__main__":
    for j in range(6):
        lista_compartilhada = lista_boa.copy()
        with open("Results/ExecuteTime" + str(j)+".txt", "r+") as f:
        #with open("Results/ExecuteTime.txt", "r+") as f:
            f.truncate(0)
        # Create and start threads
        for i in range(num_threads):
            t = threading.Thread(target=Execute, args=(i, lista_compartilhada,j))
            threads.append(t)
            t.start()

        # Wait for all threads to finish
        for t in threads:
            t.join()

        print("All threads are finished")   