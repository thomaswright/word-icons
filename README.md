# word-icons

This is a react component that will scale a given string
into a square of a given size, making the letters as large as possible.
Try it out as a placeholder for icons.

## Install

`npm install word-icons`

## Use

```jsx
import WordIcon from "word-icons";

const MyComponent = () => {
  return (
    <div>
      <WordIcon text={"Menu"} size={20} />
    </div>
  );
};
```

## API

```jsx
<WordIcon
  text={string}
  size={number}
  fontWeight={optional(string)}
  scale={optional(number)} // scales the font for fine-grained adjustment
/>
```
