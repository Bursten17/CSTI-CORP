FROM mcr.microsoft.com/mssql/server:2019-latest

ENV SA_PASSWORD=qlixim-30
ENV ACCEPT_EULA=y

COPY ./scripts/ .

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]
CMD [ "/opt/mssql/bin/sqlservr" ]
