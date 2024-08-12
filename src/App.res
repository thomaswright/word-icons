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
    let s = text
    let sArr = s->String.split("")
    let withCharWidth = sArr->Array.map(c => (c, c->getCharWidth))
    let totalWidth = withCharWidth->Array.reduce(0, (acc, (_, w)) => {
      acc + w
    })
    let rootWidth = Math.sqrt(totalWidth->Int.toFloat)
    let bound = Math.round(rootWidth *. 2.2)->Float.toInt
    let dividedArrs = {
      let (x, y, _) = withCharWidth->Array.reduce(([], [], 0), ((acc, curS, curW), (c, w)) => {
        curW + w > bound ? ([...acc, curS], [c], w) : (acc, [...curS, c], curW + w)
      })
      [...x, y]
    }
    let dividedS = dividedArrs->Array.map(curS => curS->Array.join(""))

    let widthScaler = size->Int.toFloat /. rootWidth
    let heightScaler = widthScaler /. dividedS->Array.length->Int.toFloat
    let scaledMaring = "-" ++ (0.8 *. heightScaler)->Float.toString ++ "rem"

    <div
      className={" font-black tracking-tighter leading-none flex flex-col items-center justify-center"}
      style={{
        width: size->Int.toString ++ "rem",
        height: size->Int.toString ++ "rem",
        fontSize: (2. *. widthScaler)->Float.toString ++ "rem",
      }}>
      {dividedS
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

module Wrap = {
  @react.component
  let make = (~children) => {
    <div className="p-2 border rounded w-fit m-2 border-gray-300 shadow "> {children} </div>
  }
}

@react.component
let make = () => {
  <div className="p-6">
    <Wrap>
      <WordIcon text={"Settings"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Delete"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Menu"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Hang Up"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Edit"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Home"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Zoom"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"back"} />
    </Wrap>
    <Wrap>
      <WordIcon text={"Ask Question"} />
    </Wrap>
  </div>
}
