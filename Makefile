##
## Copyright (c) 2021 - Team11. All rights reserved.
##

all: build

build: restore
	dotnet publish -c Release -o ./dist

restore:
	dotnet restore

test:
	dotnet test

align-projects: src/Directory.Build.props
	dotnet remove $< reference Neo
	dotnet add $< reference ../neo/src/neo/neo.csproj

clean:
	-@dotnet clean 2>&1 > /dev/null
	-@rm -rf ./dist
	-@rm -rf ./src/ApplicationLogs/bin
	-@rm -rf ./src/ApplicationLogs/obj
	-@rm -rf ./src/DBFTPlugin/bin
	-@rm -rf ./src/DBFTPlugin/obj
	-@rm -rf ./src/LevelDBStore/bin
	-@rm -rf ./src/LevelDBStore/obj
	-@rm -rf ./src/OracleService/bin
	-@rm -rf ./src/OracleService/obj
	-@rm -rf ./src/RocksDBStore/bin
	-@rm -rf ./src/RocksDBStore/obj
	-@rm -rf ./src/RpcClient/bin
	-@rm -rf ./src/RpcClient/obj
	-@rm -rf ./src/RpcNep17Tracker/bin
	-@rm -rf ./src/RpcNep17Tracker/obj
	-@rm -rf ./src/RpcServer/bin
	-@rm -rf ./src/RpcServer/obj
	-@rm -rf ./src/StateService/bin
	-@rm -rf ./src/StateService/obj
	-@rm -rf ./src/StatesDumper/bin
	-@rm -rf ./src/StatesDumper/obj
	-@rm -rf ./tests/Neo.Network.RPC.Tests/bin
	-@rm -rf ./tests/Neo.Network.RPC.Tests/obj
	-@rm -rf ./tests/Neo.Plugins.OracleService.Tests/bin
	-@rm -rf ./tests/Neo.Plugins.OracleService.Tests/obj
	-@rm -rf ./tests/Neo.Plugins.RpcServer.Tests/bin
	-@rm -rf ./tests/Neo.Plugins.RpcServer.Tests/obj
	-@rm -rf ./tests/Neo.Plugins.StateService.Tests/bin
	-@rm -rf ./tests/Neo.Plugins.StateService.Tests/obj
	-@rm -rf ./tests/Neo.Plugins.Storage.Tests/bin
	-@rm -rf ./tests/Neo.Plugins.Storage.Tests/obj

.PHONY: all build restore test align-project clean

.SILENT: clean
