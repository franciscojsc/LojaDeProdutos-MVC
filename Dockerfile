FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

COPY *.sln .
COPY LojaDeProdutos.Application/*.csproj ./LojaDeProdutos.Application/
RUN dotnet restore

COPY LojaDeProdutos.Application/. ./LojaDeProdutos.Application/
WORKDIR /source/LojaDeProdutos.Application
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app ./
# Padrão de container ASP.NET
# ENTRYPOINT ["dotnet", "LojaDeProdutos.Application.dll"]
# Opção utilizada pelo Heroku
CMD ASPNETCORE_URLS=http://*:$PORT dotnet LojaDeProdutos.Application.dll
