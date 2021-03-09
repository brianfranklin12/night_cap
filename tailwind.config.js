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
        purple: '#8683a3',
        red: {
          DEFAULT: '#fa7b79',
          dark: '#e16e6c',
        },
        yellow: '#ffdfb5',
        pink: '#fcbdbc',
        grey: '#4d4d4d',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
