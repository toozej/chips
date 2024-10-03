FROM python:3.12-slim

RUN pip install --upgrade pip && \
    apt-get update -qq && \
    apt-get install -y make build-essential

RUN useradd -ms /bin/bash appuser
USER appuser
WORKDIR /app

COPY --chown=appuser:appuser requirements.txt .
RUN pip3 install --user -r requirements.txt

ENV PATH="/home/appuser/.local/bin:${PATH}"

COPY --chown=appuser:appuser ./chips.sh .

CMD [ "/bin/bash", "chips.sh" ]
