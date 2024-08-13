let getCharWidth = c => {
  switch c {
  | "a" => 3
  | "b" => 3
  | "c" => 3
  | "d" => 3
  | "e" => 3
  | "f" => 2
  | "g" => 3
  | "h" => 3
  | "i" => 1
  | "j" => 3
  | "k" => 3
  | "l" => 1
  | "m" => 4
  | "n" => 3
  | "o" => 3
  | "p" => 3
  | "q" => 3
  | "r" => 2
  | "s" => 3
  | "t" => 2
  | "u" => 3
  | "v" => 3
  | "w" => 4
  | "x" => 3
  | "y" => 3
  | "z" => 3
  | " " => 3
  // | "A" => 4
  // | "B" => 4
  // | "C" => 4
  // | "D" => 4
  // | "E" => 4
  // | "F" => 4
  // | "G" => 4
  // | "H" => 4
  // | "I" => 4
  // | "J" => 4
  // | "K" => 4
  // | "L" => 4
  // | "M" => 5
  // | "N" => 4
  // | "O" => 4
  // | "P" => 4
  // | "Q" => 4
  // | "R" => 4
  // | "S" => 4
  // | "T" => 4
  // | "U" => 4
  // | "V" => 4
  // | "W" => 4
  // | "X" => 4
  // | "Y" => 4
  // | "Z" => 4
  | _ => 3
  }
}

module WordIcon = {
  @react.component
  let make = (~text: string, ~size: int=4) => {
    let textChars = text->String.split("")
    let textCharsAndCharWidth = textChars->Array.map(c => (c, c->getCharWidth))
    let textMeasure = textCharsAndCharWidth->Array.reduce(0, (acc, (_, w)) => {
      acc + w
    })
    let textMeasureRoot = Math.sqrt(textMeasure->Int.toFloat)
    let bound = Math.round(textMeasureRoot *. 2.2)->Float.toInt
    let textCharsDivisions = {
      let (x, y, _) = textCharsAndCharWidth->Array.reduce(([], [], 0), (
        (acc, curS, curW),
        (c, w),
      ) => {
        curW + w > bound ? ([...acc, curS], [c], w) : (acc, [...curS, c], curW + w)
      })
      [...x, y]
    }
    let textDivisions = textCharsDivisions->Array.map(curS => curS->Array.join(""))

    let widthScaler = size->Int.toFloat /. textMeasureRoot
    let heightScaler = widthScaler /. textDivisions->Array.length->Int.toFloat
    let scaledMaring = "-" ++ (0.8 *. heightScaler)->Float.toString ++ "rem"

    <div
      className={" font-black tracking-tighter leading-none flex flex-col items-center justify-center"}
      style={{
        width: size->Int.toString ++ "rem",
        height: size->Int.toString ++ "rem",
        fontSize: (2. *. widthScaler)->Float.toString ++ "rem",
      }}>
      {textDivisions
      ->Array.map(sPart => {
        <div
          style={
            marginTop: scaledMaring,
            marginBottom: scaledMaring,
          }>
          {sPart->React.string}
        </div>
      })
      ->React.array}
    </div>
  }
}

@react.component
let make = () => {
  <div className="p-6">
    {["Settings", "Delete", "Menu", "Hang Up", "Edit", "Home", "Zoom", "back", "Ask Question"]
    ->Array.map(text =>
      <div className="p-2 border rounded w-fit m-2 border-gray-300 shadow ">
        <WordIcon text={text} />
      </div>
    )
    ->React.array}
  </div>
}
