import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { Config } from "@remotion/cli/config";

Config.setVideoImageFormat("jpeg");
Config.setJpegQuality(92);
Config.setConcurrency(4);

// El proyecto vive en un disco USB lento y el navegador interno a veces tarda más de 25 s en arrancar desde ahí.
// Si existe una copia en el disco C: (AppData\Local\MisShortsMapas), se usa esa; si no, la normal.
const rapido = path.join(os.homedir(), "AppData", "Local", "MisShortsMapas", "chrome-headless-shell-win64", "chrome-headless-shell.exe");
if (process.platform === "win32" && fs.existsSync(rapido)) Config.setBrowserExecutable(rapido);
