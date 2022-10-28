const resistorColours = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9
}

export const value = ([c1, c2]) => {
  return ~~`${resistorColours[c1.toLowerCase()]}${resistorColours[c2.toLowerCase()]}`
};
