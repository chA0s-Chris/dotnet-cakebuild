#!/usr/bin/env bash
#

dotnet cake build.cake --bootstrap
dotnet cake build.cake $@
