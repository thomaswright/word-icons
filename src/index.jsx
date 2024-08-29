import React from "react";

function getCharWidth(c) {
  switch (c) {
    case " ":
    case "i":
    case "l":
      return 1;
    case "f":
    case "r":
    case "t":
      return 2;
    case "m":
    case "w":
      return 4;
    default:
      return 3;
  }
}

function Main({ text, size, fontWeight = "900", scale = 1 }) {
  const scaleText = (text) => {
    let measure = text.split("").reduce((acc, c) => {
      return acc + getCharWidth(c);
    }, 0);

    const applied = measure <= 12 ? measure + (12 - measure) * 0.5 : measure;

    return 2 * applied ** -0.5;
  };
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "row",
        alignItems: "center",
        justifyItems: "center",
        height: size + "px",
        width: size + "px",
      }}
    >
      <div
        style={{
          fontSize: scale * scaleText(text) * size + "px",
          fontWeight: fontWeight,
          lineHeight: "0.65",
          letterSpacing: "-0.05em",
          textAlign: "center",
          overflowWrap: "break-word",
          width: size + "px",
        }}
      >
        {text}
      </div>
    </div>
  );
}

export default Main;
