#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {

  AVAILABLE_SERVICES=$($PSQL "SELECT   CONCAT(service_id,') ',name) AS services FROM services  ORDER BY service_id")
    MAIN_MENU_SELECTION=1
    CONDITION=1
    SERVICES_ID=0
    while [ $CONDITION -eq 1 ]
     do
    echo -e "\nHere are the services we have available:"
    echo "$AVAILABLE_SERVICES" | while read SERVICES 
    do
        echo $SERVICES
    done
    read SERVICE_ID_SELECTED
#      echo "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED"
   # get services
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
     if [[ -z $SERVICE_ID ]]
     then
 #     echo "Invalida entrada"
       CONDITION=1
    else
 #     echo "Valida entrada"
      CONDITION=0
     fi
    done
     # get customer info
     # echo -e "\nWhat's the id services?"
     #   read SERVICE_ID_SELECTED
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")             
      if [[ -z $CUSTOMER_ID ]]  
         then n    
        echo -e "\nWhat's your customer name?"
        read CUSTOMER_NAME
         # insert customers
       INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")  
     #   if [$INSERT_CUSTOMER_RESULT 0 1 ] 
     #   then
         CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers ORDER BY customer_id DESC LIMIT 1")    
        fi
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")     
        echo -e "\nWhat's the time service?"
        read SERVICE_TIME
  
      NAME_SERVICES=$($PSQL "SELECT name FROM services WHERE service_id= $SERVICE_ID")
        # insert appointments
       INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID,$CUSTOMER_ID,'$SERVICE_TIME')")               
         echo I have put you down for a $NAME_SERVICES at $SERVICE_TIME, $CUSTOMER_NAME. 
}

MAIN_MENU

