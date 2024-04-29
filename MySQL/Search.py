import threading
import mysql.connector
import time
# List shared between threads
lista_compartilhada = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,20,18,19,21,22]
lista_boa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20,21,22]

#lista_compartilhada = [17,20]
#lista_boa = [17,20]


# Mutex to control access to the shared list
lock = threading.Lock()

# List to store threads
threads = []

# Set the desired number of threads
num_threads = 1

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
            conn = mysql.connector.connect(
                host="localhost",  # host do servidor MySQL
                user="root",  # nome de usuário do banco de dados
                password="",  # senha do banco de dados
                database="tpchassignment"  # nome do banco de dados
            )
           
            cursor = conn.cursor()
            inicio = time.time()
            cursor.execute(consulta,multi=True)
            fim = time.time()
            tempo_execucao = fim - inicio
            result = "Thread " +  str(numero) + " -> Time to execute " + str(query) + " : " + str(tempo_execucao) + " segundos \n"
            SendToFile(result,n)
            
        except Exception as e:
            print("Error when executing queries:", e)

        print(f"Thread {numero} ready for the next query")
    print(f"Thread {numero} finished")

def SendToFile(Message,number):
    FileName = "Results/ExecuteTimeMySQL"+str(number)+".txt"
  
    with open(FileName, 'a') as f:
            f.write(Message)





def SendToFileExplain(Message,msg):
    FileName = "Explain/ExplainPlan"+msg+".txt"
  
    with open(FileName, 'a') as f:
            f.write(Message)




#script that executes the explain plan of all the queries and save it in a file
def ExecuteExplainPlan(numero, lista, n):
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

        print(f"Thread {numero} executing EXPLAIN for {query}")

        with open(query, 'r') as file:
            consulta = file.read()

        try:
            # Configuring the connection to the database
            # Configuring the connection to the database
            conn = mysql.connector.connect(
                host="localhost",  # host do servidor MySQL
                user="root",  # nome de usuário do banco de dados
                password="",  # senha do banco de dados
                database="tpchassignment"  # nome do banco de dados
            )

            cursor = conn.cursor()
            cursor.execute("EXPLAIN FORMAT=JSON " + consulta)
            result = cursor.fetchall()
            result_str = "\n".join([str(row) for row in result])
            result = "Thread " + str(numero) + " -> Explain plan for " + str(query) + ":\n" + result_str + "\n"
            SendToFileExplain(result, "MySQL25GBPKS")

        except Exception as e:
            print("Error when executing EXPLAIN:", e)

        print(f"Thread {numero} ready for the next query")
    print(f"Thread {numero} finished")


if __name__ == "__main__":
    for j in range(3):
        lista_compartilhada = lista_boa.copy()
        with open("Results/ExecuteTimeMySQL" + str(j)+".txt", "r+") as f:
        #with open("Results/ExecuteTimeMySQL.txt", "r+") as f:
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