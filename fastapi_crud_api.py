# fastapi_crud_api.py

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional
import mysql.connector

app = FastAPI()

# Database connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Muriu@2024",
    database="clinicbookingsystem"
)
cursor = conn.cursor(dictionary=True)

# Pydantic models
class TaskBase(BaseModel):
    user_id: int
    title: str
    description: Optional[str] = None
    due_date: Optional[str] = None
    status: Optional[str] = "pending"

class Task(TaskBase):
    task_id: int

# Routes
@app.post("/tasks", response_model=Task)
def create_task(task: TaskBase):
    sql = """
    INSERT INTO Task (user_id, title, description, due_date, status)
    VALUES (%s, %s, %s, %s, %s)
    """
    values = (task.user_id, task.title, task.description, task.due_date, task.status)
    cursor.execute(sql, values)
    conn.commit()
    task_id = cursor.lastrowid
    return Task(task_id=task_id, **task.dict())

@app.get("/tasks", response_model=List[Task])
def read_tasks():
    cursor.execute("SELECT * FROM Task")
    return cursor.fetchall()

@app.get("/tasks/{task_id}", response_model=Task)
def read_task(task_id: int):
    cursor.execute("SELECT * FROM Task WHERE task_id = %s", (task_id,))
    result = cursor.fetchone()
    if not result:
        raise HTTPException(status_code=404, detail="Task not found")
    return result

@app.put("/tasks/{task_id}", response_model=Task)
def update_task(task_id: int, task: TaskBase):
    sql = """
    UPDATE Task SET user_id = %s, title = %s, description = %s, due_date = %s, status = %s
    WHERE task_id = %s
    """
    values = (task.user_id, task.title, task.description, task.due_date, task.status, task_id)
    cursor.execute(sql, values)
    conn.commit()
    return Task(task_id=task_id, **task.dict())

@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    cursor.execute("DELETE FROM Task WHERE task_id = %s", (task_id,))
    conn.commit()
    return {"message": "Task deleted successfully"}
