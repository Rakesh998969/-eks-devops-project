FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

# Install dependencies, then remove the package installer
RUN python -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && python -m pip install --no-cache-dir -r requirements.txt \
    && rm -rf /usr/local/lib/python3.11/site-packages/pip \
              /usr/local/lib/python3.11/site-packages/pip-*.dist-info \
              /usr/local/bin/pip \
              /usr/local/bin/pip3 \
              /usr/local/bin/pip3.11

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
