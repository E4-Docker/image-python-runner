#!/bin/dash

main()
{
    activate_venv
    update_python_packages
    run_python_file
}

activate_venv()
{
    . venv/Scripts/activate
}

update_python_packages()
{
    pip install --upgrade pip

    if [ -e "$REQUIREMENTS_FILE_NAME".txt ]; then
        pip install -r "$REQUIREMENTS_FILE_NAME".txt
    fi
}

run_python_file()
{
    python "$PYTHON_FILE_NAME".py
}

main
