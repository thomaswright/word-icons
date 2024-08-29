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
  | " " => 1
  | _ => 3
  }
}

module WordIcon = {
  @react.component
  let make = (~text, ~size) => {
    let scaleText = text => {
      let measure =
        text
        ->String.split("")
        ->Array.reduce(0, (acc, c) => {
          acc + c->getCharWidth
        })

      let applied = switch measure {
      | x if x <= 12 => x->Int.toFloat +. (12. -. x->Int.toFloat) *. 0.5
      | x => x->Int.toFloat
      }

      0.13 *. applied ** -0.5
    }
    <div
      style={{
        display: "flex",
        flexDirection: "row",
        alignItems: "center",
        justifyItems: "center",
        height: size->Int.toString ++ "px",
        width: size->Int.toString ++ "px",
      }}>
      <div
        style={{
          fontSize: (scaleText(text) *. size->Int.toFloat)->Float.toString ++ "em",
          fontWeight: "900",
          lineHeight: "0.65",
          letterSpacing: "-0.05em",
          textAlign: "center",
          overflowWrap: "break-word",
          width: size->Int.toString ++ "px",
        }}>
        {text->React.string}
      </div>
    </div>
  }
}

@react.component
let make = () => {
  let size = 20
  <div className="p-6 ">
    <div className="flex flex-row max-w-lg flex-wrap">
      {["Menu", "Close", "Settings", "Delete", "Hang Up", "Search", "Home", "Zoom", "Edit", "back"]
      ->Array.map(text => {
        <div
          className=" p-2 border rounded m-2 border-gray-300 shadow flex flex-row items-center gap-2">
          <WordIcon text={text} size={size} />
          <div className="h-5 text-lg"> {"Search"->React.string} </div>
        </div>
      })
      ->React.array}
    </div>
  </div>
}
