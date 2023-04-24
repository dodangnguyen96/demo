# build stage
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY Demo/*.csproj ./Demo/
RUN dotnet restore ./Demo/Demo.csproj

# copy everything else and build app
COPY Demo/. ./Demo/
WORKDIR /app/Demo
RUN dotnet publish ./Demo.csproj -c Release -o out

# runtime stage
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/Demo/out ./
ENTRYPOINT ["dotnet", "Demo.dll"]