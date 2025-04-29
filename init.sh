#!/bin/dash

main()
{
    activate_venv
    update_python_packages
    run_python_file
}

activate_venv()
{
    . "$VENV_PATH"/bin/activate
}

update_python_packages()
{
    python -m pip install --upgrade pip

    if [ -e "$REQUIREMENTS_FILE_NAME".txt ]; then
        python -m pip install -r "$REQUIREMENTS_FILE_NAME".txt
    else
        echo "$REQUIREMENTS_FILE_NAME.txt not found."
    fi
}

run_python_file()
{
    python "$PYTHON_FILE_NAME".py
}

main
