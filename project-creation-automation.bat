@echo off
setlocal enabledelayedexpansion

echo Welcome to Vite + React + Tailwind + Shadcn UI Project Setup
echo =========================================================

:: Get project name and version preference
set /p PROJECT_NAME="Enter your project name: "
set /p TS_VERSION="Use TypeScript? (y/n): "

:: Set template based on choice
if /i "%TS_VERSION%"=="y" (
    set "TEMPLATE=react-ts"
    set "EXT=tsx"
) else (
    set "TEMPLATE=react"
    set "EXT=jsx"
)

:: Create Vite project
echo.
echo Creating Vite project...
call npm create vite@latest %PROJECT_NAME% -- --template %TEMPLATE%
if %ERRORLEVEL% neq 0 goto :error

:: Navigate to project directory
cd %PROJECT_NAME%

:: Install dependencies
echo.
echo Installing dependencies...
call npm install
if %ERRORLEVEL% neq 0 goto :error

:: Install Tailwind and its dependencies
echo.
echo Installing Tailwind CSS...
call npm install -D tailwindcss postcss autoprefixer
call npx tailwindcss init -p
if %ERRORLEVEL% neq 0 goto :error

:: Create a temporary file for tailwind config
echo.
echo Configuring Tailwind...
echo /** @type {import('tailwindcss').Config} */> tailwind.config.js
echo export default {>> tailwind.config.js
echo   content: [>> tailwind.config.js
echo     "./index.html",>> tailwind.config.js
echo     "./src/**/*.{js,ts,jsx,tsx}",>> tailwind.config.js
echo   ],>> tailwind.config.js
echo   theme: {>> tailwind.config.js
echo     extend: {},>> tailwind.config.js
echo   },>> tailwind.config.js
echo   plugins: [],>> tailwind.config.js
echo }>> tailwind.config.js

:: Update index.css
echo.
echo Updating index.css...
echo @tailwind base;> src\index.css
echo @tailwind components;>> src\index.css
echo @tailwind utilities;>> src\index.css

:: Install @types/node
echo.
echo Installing @types/node...
call npm i -D @types/node
if %ERRORLEVEL% neq 0 goto :error

:: Configure TypeScript or JavaScript based on choice
if /i "%TS_VERSION%"=="y" (
    echo.
    echo Updating TypeScript configuration...
    echo {> tsconfig.json
    echo   "files": [],>> tsconfig.json
    echo   "references": [>> tsconfig.json
    echo     {>> tsconfig.json
    echo       "path": "./tsconfig.app.json">> tsconfig.json
    echo     },>> tsconfig.json
    echo     {>> tsconfig.json
    echo       "path": "./tsconfig.node.json">> tsconfig.json
    echo     }>> tsconfig.json
    echo   ],>> tsconfig.json
    echo   "compilerOptions": {>> tsconfig.json
    echo     "baseUrl": ".",>> tsconfig.json
    echo     "paths": {>> tsconfig.json
    echo       "@/*": ["./src/*"]>> tsconfig.json
    echo     }>> tsconfig.json
    echo   }>> tsconfig.json
    echo }>> tsconfig.json
) else (
    echo.
    echo Creating JavaScript configuration...
    echo {> jsconfig.json
    echo   "compilerOptions": {>> jsconfig.json
    echo     "baseUrl": ".",>> jsconfig.json
    echo     "paths": {>> jsconfig.json
    echo       "@/*": ["./src/*"]>> jsconfig.json
    echo     }>> jsconfig.json
    echo   }>> jsconfig.json
    echo }>> jsconfig.json
)

:: Update vite.config
if /i "%TS_VERSION%"=="y" (
    set "CONFIG_EXT=ts"
) else (
    set "CONFIG_EXT=js"
)

echo.
echo Updating Vite configuration...
echo import path from "path"> vite.config.%CONFIG_EXT%
echo import react from "@vitejs/plugin-react">> vite.config.%CONFIG_EXT%
echo import { defineConfig } from "vite">> vite.config.%CONFIG_EXT%
echo.>> vite.config.%CONFIG_EXT%
echo export default defineConfig({>> vite.config.%CONFIG_EXT%
echo   plugins: [react()],>> vite.config.%CONFIG_EXT%
echo   resolve: {>> vite.config.%CONFIG_EXT%
echo     alias: {>> vite.config.%CONFIG_EXT%
echo       "@": path.resolve(__dirname, "./src"),>> vite.config.%CONFIG_EXT%
echo     },>> vite.config.%CONFIG_EXT%
echo   },>> vite.config.%CONFIG_EXT%
echo })>> vite.config.%CONFIG_EXT%

:: Initialize Shadcn UI
echo.
echo Installing Shadcn UI...
call npx shadcn@latest init
if %ERRORLEVEL% neq 0 goto :error

:: Install required shadcn components
echo.
echo Installing required components...
call npx shadcn@latest add button card separator
if %ERRORLEVEL% neq 0 goto :error

:: Also install lucide-react for icons
echo.
echo Installing lucide-react for icons...
call npm install lucide-react
if %ERRORLEVEL% neq 0 goto :error

:: Update App file
echo.
echo Creating simple starter interface...
echo import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"> src\App.%EXT%
echo import { Github, Twitter, Globe } from "lucide-react">> src\App.%EXT%
echo import { Button } from "@/components/ui/button">> src\App.%EXT%
echo import { Separator } from "@/components/ui/separator">> src\App.%EXT%
echo.>> src\App.%EXT%
echo function App() {>> src\App.%EXT%
echo   return (>> src\App.%EXT%
echo     ^<div className="min-h-screen bg-background p-4 space-y-8"^>>> src\App.%EXT%
echo       ^<div className="max-w-2xl mx-auto text-center space-y-4"^>>> src\App.%EXT%
echo         ^<h1 className="text-4xl font-bold"^>Welcome to Vite + React^</h1^>>> src\App.%EXT%
echo         ^<p className="text-muted-foreground"^>Get started by editing ^<code className="text-sm font-mono bg-secondary px-1.5 py-0.5 rounded"^>src/App.%EXT%^</code^>^</p^>>> src\App.%EXT%
echo       ^</div^>>> src\App.%EXT%
echo       ^<div className="max-w-2xl mx-auto"^>>> src\App.%EXT%
echo         ^<Card^>>> src\App.%EXT%
echo           ^<CardHeader^>>> src\App.%EXT%
echo             ^<CardTitle^>Quick Start Guide^</CardTitle^>>> src\App.%EXT%
echo           ^</CardHeader^>>> src\App.%EXT%
echo           ^<CardContent className="space-y-4"^>>> src\App.%EXT%
echo             ^<p className="text-sm text-muted-foreground"^>This template includes:^</p^>>> src\App.%EXT%
echo             ^<div className="grid gap-2 text-sm"^>>> src\App.%EXT%
echo               ^<div className="flex items-center gap-2"^>>> src\App.%EXT%
echo                 ^<div className="h-1.5 w-1.5 rounded-full bg-primary" /^>>> src\App.%EXT%
echo                 ^<span^>Vite for fast development and building^</span^>>> src\App.%EXT%
echo               ^</div^>>> src\App.%EXT%
echo               ^<div className="flex items-center gap-2"^>>> src\App.%EXT%
echo                 ^<div className="h-1.5 w-1.5 rounded-full bg-primary" /^>>> src\App.%EXT%
echo                 ^<span^>Tailwind CSS for styling^</span^>>> src\App.%EXT%
echo               ^</div^>>> src\App.%EXT%
echo               ^<div className="flex items-center gap-2"^>>> src\App.%EXT%
echo                 ^<div className="h-1.5 w-1.5 rounded-full bg-primary" /^>>> src\App.%EXT%
echo                 ^<span^>Shadcn UI for beautiful components^</span^>>> src\App.%EXT%
echo               ^</div^>>> src\App.%EXT%
echo             ^</div^>>> src\App.%EXT%
echo           ^</CardContent^>>> src\App.%EXT%
echo         ^</Card^>>> src\App.%EXT%
echo       ^</div^>>> src\App.%EXT%
echo       ^<footer className="max-w-2xl mx-auto"^>>> src\App.%EXT%
echo         ^<Separator className="my-4" /^>>> src\App.%EXT%
echo         ^<div className="flex justify-center gap-4"^>>> src\App.%EXT%
echo           ^<a href="https://github.com/BurningHat20" target="_blank" rel="noopener noreferrer" className="text-muted-foreground hover:text-foreground"^>>> src\App.%EXT%
echo             ^<Github size={20} /^>>> src\App.%EXT%
echo           ^</a^>>> src\App.%EXT%
echo           ^<a href="https://x.com/yashgohel_" target="_blank" rel="noopener noreferrer" className="text-muted-foreground hover:text-foreground"^>>> src\App.%EXT%
echo             ^<Twitter size={20} /^>>> src\App.%EXT%
echo           ^</a^>>> src\App.%EXT%
echo           ^<a href="https://www.burninghat.tech" target="_blank" rel="noopener noreferrer" className="text-muted-foreground hover:text-foreground"^>>> src\App.%EXT%
echo             ^<Globe size={20} /^>>> src\App.%EXT%
echo           ^</a^>>> src\App.%EXT%
echo         ^</div^>>> src\App.%EXT%
echo       ^</footer^>>> src\App.%EXT%
echo     ^</div^>>> src\App.%EXT%
echo   )>> src\App.%EXT%
echo }>> src\App.%EXT%
echo.>> src\App.%EXT%
echo export default App>> src\App.%EXT%

:: Delete App.css since we're using Tailwind
del src\App.css

:: Start development server and open browser
echo.
echo Starting development server...
start "" cmd /c "npm run dev && start http://localhost:5173"

echo.
echo =========================================================
echo Setup completed successfully!
echo Development server starting...
echo The application will open in your default browser shortly.
goto :end

:error
echo.
echo An error occurred during setup!
exit /b 1

:end
endlocal