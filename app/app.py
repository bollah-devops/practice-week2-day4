from flask import Flask, request, redirect, url_for

app = Flask(__name__)

tasks = []


@app.route("/")
def home():
    return """
    <div style="font-family:Arial,sans-serif;text-align:center;padding:50px;">
        <h1 style="color:#2c3e50;">Task Manager</h1>
        <p>Welcome to the Task Manager Application</p>

        <div style="margin-top:20px;">
            <a href="/tasks"
               style="padding:10px 20px;
                      background:#3498db;
                      color:white;
                      text-decoration:none;
                      border-radius:5px;
                      margin-right:10px;">
                View Tasks
            </a>

            <a href="/add"
               style="padding:10px 20px;
                      background:#27ae60;
                      color:white;
                      text-decoration:none;
                      border-radius:5px;">
                Add Task
            </a>
        </div>
    </div>
    """


@app.route("/tasks")
def list_tasks():
    if not tasks:
        task_items = """
        <li style="padding:8px;background:#f4f4f4;border-radius:4px;">
            No tasks available.
        </li>
        """
    else:
        task_items = "".join(
            f"""
            <li style="padding:8px;margin-bottom:5px;background:#f4f4f4;border-radius:4px;">
                {i}. {task}
            </li>
            """
            for i, task in enumerate(tasks, start=1)
        )

    return f"""
    <div style="font-family:Arial,sans-serif;max-width:700px;margin:auto;padding:30px;">
        <h1>Task List</h1>

        <ul style="list-style:none;padding:0;">
            {task_items}
        </ul>

        <a href="/add"
           style="display:inline-block;
                  margin-top:15px;
                  padding:10px 20px;
                  background:#27ae60;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;">
            Add Task
        </a>
    </div>
    """


@app.route("/add", methods=["GET", "POST"])
def add_task():
    if request.method == "POST":
        task = request.form.get("task")

        if task:
            tasks.append(task.strip())

        return redirect(url_for("list_tasks"))

    return """
    <div style="font-family:Arial,sans-serif;max-width:500px;margin:auto;padding:30px;">
        <h1>Add Task</h1>

        <form method="POST">
            <input
                type="text"
                name="task"
                placeholder="Enter task"
                required
                style="width:100%;
                       padding:10px;
                       margin-bottom:10px;
                       border:1px solid #ccc;
                       border-radius:5px;
                       box-sizing:border-box;"
            >

            <button
                type="submit"
                style="padding:10px 20px;
                       background:#3498db;
                       color:white;
                       border:none;
                       border-radius:5px;
                       cursor:pointer;">
                Add Task
            </button>
        </form>
    </div>
    """


@app.route("/health")
def health():
    return {
        "healthy": True,
        "application": "task_manager",
        "status": "ok"
    }, 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)