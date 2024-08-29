import { marked } from "marked";
import React, { useState } from "react";
import WordIcon from "word-icons";

const aboutText = `This is a react component that will scale a given string 
into a square of a given size, making the letters as large as possible. 
Try it out as a placeholder for icons. See the [github repo](https://github.com/thomaswright/word-icons) 
for more information.`;

const codeExample = `import WordIcon from "word-icons";

const MyComponent = () => {
  return (
    <div>
      <WordIcon text={"Menu"} size={20}/>
    </div>
  );
}`;

function Dedication() {
  return (
    <div className="text-slate-500 text-xs">
      {"By "}
      <a
        className="text-blue-500 font-medium"
        href={"https://github.com/thomaswright"}
      >
        {"Thomas Wright"}
      </a>
    </div>
  );
}

function App() {
  let [size, setSize] = useState(40);
  let [iconText, setIconText] = useState("Example");

  return (
    <div className="bg-plain-900 text-plain-100 h-screen overflow-y-scroll">
      <div className="max-w-3xl min-h-full flex flex-col gap-8 p-6">
        <div className="p-2 border rounded-lg border-plain-600 flex flex-row items-center gap-2 w-fit">
          <WordIcon text={"Word Icons"} size={80} />
        </div>

        <div className="flex flex-row max-w-lg flex-wrap gap-2">
          {[
            "Menu",
            "Close",
            "Settings",
            "Delete",
            "Search",
            "Home",
            "Zoom",
            "Back",
            "Something Else",
          ].map((text) => {
            return (
              <div className=" p-2 border rounded border-plain-600 flex flex-row items-center gap-2">
                <WordIcon text={text} size={20} />
              </div>
            );
          })}
        </div>
        <div
          className="  text-sm"
          dangerouslySetInnerHTML={{
            __html: marked.parse(aboutText),
          }}
        />
        <hr className="border-plain-700" />

        <div className="w-80">
          <input
            className="py-1 px-2 text-plain-800 mb-8"
            type="text"
            value={iconText}
            onChange={(e) => setIconText(e.target.value)}
          />
          <input
            className=""
            type="range"
            min="10"
            max="100"
            value={size}
            onChange={(e) => setSize(e.target.value)}
          />
        </div>
        <div className=" p-2 border rounded border-plain-600 flex flex-row items-center gap-2 w-fit">
          <WordIcon text={iconText} size={size} />
        </div>
        <hr className="border-plain-700" />

        <div className=" text-xs ">
          <div className="font-mono py-2 px-3 bg-plain-800 w-fit rounded">
            npm install word-icons
          </div>
        </div>

        <div className=" text-xs ">
          <pre className="font-mono py-2 px-3 bg-plain-800 w-fit rounded">
            {codeExample}
          </pre>
        </div>
        <div className="flex-1" />

        <Dedication />
      </div>
    </div>
  );
}

export default App;
