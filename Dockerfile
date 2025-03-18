FROM python:3.10

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

#CMD ["bash", "-c", "flask db upgrade && flask run --host=0.0.0.0"]

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:create_app()"]

