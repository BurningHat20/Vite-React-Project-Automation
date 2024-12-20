# Vite React Project Automation

A powerful Windows batch script to automatically set up a new React project with Vite, Tailwind CSS, and Shadcn UI components. This automation tool streamlines the project initialization process and sets up a modern, production-ready development environment.

## 🚀 Features

- Automated setup of Vite + React project
- Optional TypeScript support
- Integrated Tailwind CSS configuration
- Pre-configured Shadcn UI components
- Path aliases (@/) configured out of the box
- Lucide React icons included
- Development server auto-start
- Sample template with modern UI components
- Responsive layout structure
- Dark mode support (via Shadcn UI)

## 📋 Prerequisites

Before running this script, make sure you have the following installed:

- Node.js (Latest LTS version recommended)
- npm (Comes with Node.js)
- A Windows operating system

## 🛠️ Installation

1. Clone this repository:

```bash
git clone https://github.com/BurningHat20/Vite-React-Project-Automation.git
```

2. Navigate to the project directory:

```bash
cd Vite-React-Project-Automation
```

## 💻 Usage

1. Run the batch script:

```bash
setup-project.bat
```

2. Follow the interactive prompts:

   - Enter your project name
   - Choose whether to use TypeScript (y/n)

3. Wait for the automation to complete. The script will:

   - Create a new Vite project
   - Install and configure Tailwind CSS
   - Set up Shadcn UI components
   - Configure path aliases
   - Install required dependencies
   - Create a sample homepage
   - Start the development server

4. Once completed, your browser will automatically open to `http://localhost:5173`

## 📁 Project Structure

The generated project will have the following structure:

```
your-project/
├── src/
│   ├── components/
│   │   └── ui/
│   ├── App.jsx/tsx
│   ├── main.jsx/tsx
│   └── index.css
├── public/
├── tailwind.config.js
├── vite.config.js/ts
└── package.json
```

## ⚙️ Included Configurations

- **Vite**: Configured with React plugin and path aliases
- **Tailwind CSS**: Set up with base, components, and utilities
- **Shadcn UI**: Pre-configured with Button, Card, and Separator components
- **TypeScript** (optional): Includes path aliases and strict mode
- **Path Aliases**: `@/*` configured for `src` directory

## 🎨 Pre-installed Components

The template comes with several pre-installed Shadcn UI components:

- Button
- Card
- Separator

Plus Lucide React icons for enhanced UI elements.

## 🔧 Customization

You can modify the script to:

- Add more Shadcn UI components
- Change the default template
- Modify the Tailwind configuration
- Add more dependencies

Edit the batch script directly to customize the setup process according to your needs.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📝 License

[MIT License](LICENSE)

## 🙏 Acknowledgments

- [Vite](https://vitejs.dev/)
- [React](https://reactjs.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Shadcn UI](https://ui.shadcn.com/)
- [Lucide Icons](https://lucide.dev/)

## 📞 Contact

- GitHub: [@BurningHat20](https://github.com/BurningHat20)
- Twitter: [@yashgohel\_](https://x.com/yashgohel_)

## ⭐ Support

If you found this project helpful, please consider giving it a star on GitHub!
