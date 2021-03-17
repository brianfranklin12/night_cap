module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      'header': ['Futura', 'Helvetica', 'sans-serif'],
    },
    extend: {
      colors: {
        greyblue: '#99abb0',
        purple: {
          DEFAULT: '#8683a3',
          dark: '#787592',
        },
        red: {
          DEFAULT: '#fa7b79',
          dark: '#e16e6c',
        },
        yellow: {
          DEFAULT: '#ffdfb5',
          dark: '#e5c8a2',
        },
        pink: {
          DEFAULT: '#fcbdbc',
          dark: '#e2aaa9',
        },
        grey: {
          DEFAULT: '#4d4d4d',
          dark: '#454545',
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
  ],
}
