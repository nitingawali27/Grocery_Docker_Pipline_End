# Start from official python slim image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy current folder contents into the container
COPY . /app

# Install Robot Framework and RequestsLibrary dependencies
RUN pip install --no-cache-dir robotframework robotframework-requests requests

# Default command to run your specific robot test file
CMD ["robot", "-d", "output", "testcases/grocery.robot"]
