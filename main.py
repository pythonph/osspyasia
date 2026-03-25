import json
import air

app = air.Air()


@app.page
def index(request: air.Request):
    with open("projects.json", "r") as f:
        projects_data = json.load(f)
    return app.jinja(
        request,
        "index.html",
        title="PythonAsia Open Source",
        projects=projects_data,
    )
