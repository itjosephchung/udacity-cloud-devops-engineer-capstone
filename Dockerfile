FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY mkdocs.yml requirements.txt /app/
COPY docs /app/docs/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013, DL3042
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 8000
EXPOSE 8000

## Step 5:
# Run mkdocs at container launch
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
