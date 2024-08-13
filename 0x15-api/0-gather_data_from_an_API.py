#!/usr/bin/python3
import requests
import sys

def get_employee_todo_progress(employee_id):
    
    user_url = f'https://jsonplaceholder.typicode.com/users/{employee_id}'
    user_response = requests.get(user_url)
                
    if user_response.status_code != 200:
        print(f"User with ID {employee_id} not found.")
        return

    user_data = user_response.json()
    employee_name = user_data.get('name')

    todo_url = f'https://jsonplaceholder.typicode.com/users/{employee_id}/todos'
    todo_response = requests.get(todo_url)
    
    if todo_response.status_code != 200:
        print(f"Could not retrieve TODO list for user with ID {employee_id}.")
        return

    todo_data = todo_response.json()

    total_tasks = len(todo_data)
    done_tasks = [task for task in todo_data if task['completed']]
    number_of_done_tasks = len(done_tasks)
    print(f"Employee {employee_name} is done with tasks({number_of_done_tasks}/{total_tasks}):")
    for task in done_tasks:
        print(f"\t {task['title']}")

    if __name__ == '__main__':
        if len(sys.argv) != 2:
            print("Usage: python script.py <employee_id>")
        else:
            try:
                employee_id = int(sys.argv[1])
                get_employee_todo_progress(employee_id)
            except ValueError:
                print("The employee ID must be an integer.")

