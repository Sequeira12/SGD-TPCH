import threading
import psycopg2
import time
# List shared between threads
lista_compartilhada = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20,21,22]

# Mutex to control access to the shared list
lock = threading.Lock()

# List to store threads
threads = []

# Set the desired number of threads
num_threads = 5

def Execute(numero, lista):
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
            
    
        try:
       # Configuring the connection to the database
            conn = psycopg2.connect(
            host="localhost",
            database="tpch-cloud",
            user="postgres",
            password="postgres"
            )
           
            cursor = conn.cursor()
            inicio = time.time()
            cursor.execute(consulta)
            fim = time.time()
            tempo_execucao = fim - inicio
            result = "Thread " +  str(numero) + " -> Time to execute " + str(query) + " : " + str(tempo_execucao) + " seconds \n"
            SendToFile(result)
            
        except Exception as e:
            print("Error when executing queries:", e)

        print(f"Thread {numero} ready for the next query")
    print(f"Thread {numero} finished")

def SendToFile(Message):
    FileName = "Results/ExecuteTime.txt"
  
    with open(FileName, 'a') as f:
            f.write(Message)





if __name__ == "__main__":
    with open("Results/ExecuteTime.txt", "r+") as f:
        f.truncate(0)
    # Create and start threads
    for i in range(num_threads):
        t = threading.Thread(target=Execute, args=(i, lista_compartilhada))
        threads.append(t)
        t.start()

    # Wait for all threads to finish
    for t in threads:
        t.join()

    print("All threads are finished")   