FROM python:3.11-slim

WORKDIR /app

# Upgrade Python packaging tools to patched versions
RUN python -m pip install --no-cache-dir --upgrade pip setuptools wheel

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
