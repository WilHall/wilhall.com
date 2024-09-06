const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,cjs,svelte}",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      backgroundImage: {
        leaves: "url('/background.png')",
      },
      colors: {
        primary: "#8694c9",
        secondary: "#257294",
        tertiary: "#edb16b",
      },
      boxShadow: {
        "border-primary": "0 0 0 5px #8694C9, 2px 3px 5px 2px #555",
        "border-bg": "0 0 0 5px #f8f8f8, 2px 3px 5px 2px #555",
      },
      fontFamily: {
        serif: ["Merriweather", ...defaultTheme.fontFamily.serif],
        sans: ["Merriweather Sans", ...defaultTheme.fontFamily.sans],
        dreamboat: ["Dreamboat", ...defaultTheme.fontFamily.sans],
      },
      screens: {
        "3xl": "2048px",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
