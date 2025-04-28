#!/bin/dash

main()
{
    activate_venv
    update_python_packages
    run_python_file
}

activate_venv()
{
    dash venv/Scripts/activate
}

update_python_packages()
{
    pip install --upgrade pip

    REQUIREMENTS=requirements.txt

    if [ -e "$REQUIREMENTS" ]; then
        pip install -r "$REQUIREMENTS"
    fi
}

run_python_file()
{
    python "$PYTHON_FILE_NAME".py
}

main
