# Gebruik een officiële Python 3.12 image als basis
FROM python:latest

# Zet de omgeving voor een niet-bufferende uitvoer van Python (voor loggen en debugging)
ENV PYTHONUNBUFFERED 1

# Stel de werkdirectory in
WORKDIR /app

# Kopieer de vereisten voor Python naar de container
COPY requirements.txt /app/

# Installeer de vereiste dependencies
RUN pip install --no-cache-dir --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org -r requirements.txt

# Kopieer de rest van de applicatie naar de container
COPY . /app/

# Expose de poort voor de Django app
EXPOSE 8000

# Zet het commando om de Django applicatie te starten
CMD ["gunicorn", "firstapp.wsgi:application", "--bind", "0.0.0.0:8000", "--reload"]
