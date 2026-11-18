import React from "react";
import { Composition } from "remotion";
import { Presentacion } from "./Video";

export const Root: React.FC = () => (
  <Composition id="Presentacion" component={Presentacion} durationInFrames={900} fps={30} width={1920} height={1080} />
);
