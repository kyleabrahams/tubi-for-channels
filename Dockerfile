# Use the ARM64 variant of the Python 3.12 slim image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /tubi-for-channels

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Install dependencies listed in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
#RUN pip3 install -r requirements.txt

COPY pywsgi.py ./
COPY tubi.py ./
COPY tubi_tmsid.csv ./


# Set environment variables
ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin"
ENV PYTHONUNBUFFERED=1

EXPOSE 7777/tcp
CMD ["python3","pywsgi.py"]