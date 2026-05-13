FROM python:3.11-slim
LABEL version="1778646422"
WORKDIR /app
RUN apt-get update && apt-get install -y libpq-dev gcc && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY config.py database.py start.py ./
COPY bot/ bot/
COPY web/ web/
COPY templates/ templates/
ENV PYTHONUNBUFFERED=1
CMD ["python","-u","start.py"]