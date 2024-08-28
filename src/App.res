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
  let make = (~text: string, ~size: float=4.) => {
    let textChars = text->String.split("")
    let textMeasure = textChars->Array.reduce(0, (acc, c) => {
      acc + c->getCharWidth
    })
    let textMeasureRoot = Math.sqrt(textMeasure->Int.toFloat)
    let bound = Math.round(textMeasureRoot *. 2.2)->Float.toInt
    let textDivisions = {
      let (x, y, _) = textChars->Array.reduce(([], [], 0), ((acc, curS, curW), c) => {
        let w = c->getCharWidth
        curW + w > bound ? ([...acc, curS], [c], w) : (acc, [...curS, c], curW + w)
      })
      [...x, y]
    }->Array.map(curS => curS->Array.join(""))

    let widthScaler = size /. textMeasureRoot
    let heightScaler = widthScaler /. textDivisions->Array.length->Int.toFloat
    let scaledMaring = "-" ++ (0.8 *. heightScaler)->Float.toString ++ "rem"

    <div
      className={"font-black tracking-tighter leading-none flex flex-col items-center justify-center"}
      style={{
        width: size->Float.toString ++ "rem",
        height: size->Float.toString ++ "rem",
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

// let getScaler = text => {
//   let textChars = text->String.split("")
//   let textMeasure = textChars->Array.reduce(0, (acc, c) => {
//     acc + c->getCharWidth
//   })

//   0.1 /. (textMeasure->Int.toFloat +. 0.7) ** 0.4
// }

// "Settings", "Delete", "Menu", "Hang Up", "Home", "Zoom", "back", "Ask Question"
@react.component
let make = () => {
  let (valueA, setValueA) = React.useState(_ => 0.1)
  let (valueB, setValueB) = React.useState(_ => 1.4)
  let (valueC, setValueC) = React.useState(_ => 0.4)

  let getScaler = text => {
    let textChars = text->String.split("")
    let textMeasure = textChars->Array.reduce(0, (acc, c) => {
      acc + c->getCharWidth
    })

    valueA /. (textMeasure->Int.toFloat +. valueB) ** valueC
  }

  let size = 60
  <div className="p-6">
    <div className="flex flex-col w-80">
      <div>
        <div className="w-5"> {valueA->Float.toString->React.string} </div>
        <input
          type_={"range"}
          value={valueA->Float.toString}
          min={"0"}
          max={"0.15"}
          step={0.001}
          onChange={e =>
            setValueA(v => (e->ReactEvent.Form.target)["value"]->Float.fromString->Option.getOr(v))}
        />
      </div>
      <div>
        <div className="w-5"> {valueB->Float.toString->React.string} </div>
        <input
          type_={"range"}
          value={valueB->Float.toString}
          min={"0"}
          max={"5"}
          step={0.01}
          onChange={e =>
            setValueB(v => (e->ReactEvent.Form.target)["value"]->Float.fromString->Option.getOr(v))}
        />
      </div>
      <div>
        <div className="w-5"> {valueC->Float.toString->React.string} </div>
        <input
          type_={"range"}
          value={valueC->Float.toString}
          min={"0"}
          max={"2"}
          step={0.01}
          onChange={e =>
            setValueC(v => (e->ReactEvent.Form.target)["value"]->Float.fromString->Option.getOr(v))}
        />
      </div>
    </div>
    // {["Edit", "i", "Something extra extra long", "Zoom"]
    // ->Array.map(text =>
    //   <div className="p-2 border rounded w-fit m-2 border-gray-300 shadow ">
    //     <WordIcon text={text} />
    //   </div>
    // )
    // ->React.array}
    <div className="flex flex-row max-w-lg flex-wrap">
      {[
        "Settings",
        "Delete",
        "Hang Up",
        "i",
        "Menu",
        "Home",
        "Zoom",
        "back",
        "Ask Question",
        "Something extra extra long",
      ]
      ->Array.map(text => {
        let scaler = getScaler(text)
        <div className=" p-2 border rounded m-2 border-gray-300 shadow w-fit">
          <div
            style={{
              fontSize: (scaler *. size->Int.toFloat)->Float.toString ++ "rem",
              fontWeight: "900",
              lineHeight: "0.6",
              letterSpacing: "-0.05em",
              textAlign: "center",
              overflowWrap: "break-word",
              height: size->Int.toString ++ "px",
              width: size->Int.toString ++ "px",
            }}>
            {text->React.string}
          </div>
        </div>
      })
      ->React.array}
    </div>

    // {[
    //   ("i", 15),
    //   ("By", 12),
    //   ("Settings", 8),
    //   ("Delete", 9),
    //   ("Menu", 10),
    //   ("Hang Up", 7),
    //   ("Home", 10),
    //   ("Zoom", 10),
    //   ("back", 10),
    //   ("Ask Question", 6),
    // ]
    // ->Array.map(((text, scale)) => {
    //   // let scaler = getScaler(text)
    //   <div className=" p-2 border rounded m-2 border-gray-300 shadow w-fit">
    //     <div
    //       style={{
    //         fontSize: (0.004 *. scale->Int.toFloat *. size->Int.toFloat)->Float.toString ++ "rem",
    //         fontWeight: "900",
    //         lineHeight: "0.6",
    //         letterSpacing: "-0.05em",
    //         textAlign: "center",
    //         overflowWrap: "break-word",
    //         height: size->Int.toString ++ "px",
    //         width: size->Int.toString ++ "px",
    //       }}>
    //       {text->React.string}
    //     </div>
    //   </div>
    // })
    // ->React.array}
  </div>
}
