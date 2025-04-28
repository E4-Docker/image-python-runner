#!/bin/dash

main()
{
    update_python_packages
    run_python
}

update_python_packages()
{
    python -m pip install --user --upgrade pip

    REQUIREMENTS=requirements.txt

    if [ -e "$REQUIREMENTS" ]; then
        pip install -r "$REQUIREMENTS"
    fi
}

run_python()
{
    python "$PYTHON_FILE_NAME".py
}

main
