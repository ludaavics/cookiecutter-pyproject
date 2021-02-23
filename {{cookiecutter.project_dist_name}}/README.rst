##############################
{{cookiecutter.project_name}}
##############################

.. image:: https://img.shields.io/badge/python-{{cookiecutter.python_version}}+-blue.svg
  :target: https://www.python.org/downloads/

{% if cookiecutter.license == 'MIT' -%}
.. image:: https://img.shields.io/github/license/{{cookiecutter.github_username}}/{{cookiecutter.project_dist_name}}
  :target: https://choosealicense.com/licenses/mit/
  :alt: MIT License

{% endif -%}

{{cookiecutter.description}}
