#!/bin/dash

main()
{
    activate_venv
    update_python_packages
    run_python_file
}

activate_venv()
{
    . venv/bin/activate
}

update_python_packages()
{
    python -m pip install --upgrade pip

    if [ -e requirements.txt ]; then
        python -m pip install -r requirements.txt
    else
        echo "requirements.txt not found."
    fi
}

run_python_file()
{
    python "$PYTHON_FILE_NAME".py
}

main
