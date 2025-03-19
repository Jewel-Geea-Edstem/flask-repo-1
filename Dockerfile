# Use an official Python image as the base
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Set environment variables
ENV FLASK_APP=app:create_app

# Expose port 5000
EXPOSE 5000

# Run database migrations before starting the app
CMD ["sh", "-c", "flask db upgrade && gunicorn -b 0.0.0.0:5000 'app:create_app()'"]
