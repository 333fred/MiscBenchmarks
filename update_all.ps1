# Yes I like to live dangerously 😎
fastmod ">net7\.0<" ">net8.0<" --accept-all
Get-ChildItem |
    Where-Object { $_.PSIsContainer } |
    ForEach {
        pushd $_.FullName
        Get-ChildItem *.csproj | ForEach {
        "dotnet run --configuration Release $($_.Name)"
         if (!(Test-Path *.sln)) {
            dotnet new sln
            dotnet sln add $_.Name
        }

        dotnet run --configuration Release $($_.Name)
        ..\update_results.ps1
        }

        popd
    }