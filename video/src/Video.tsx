// SPACE LEGACY — vídeo de presentación (30 s, 1920×1080)
// Los textos están en TEXTOS, justo debajo: se pueden cambiar sin tocar nada más.
import React from "react";
import { AbsoluteFill, Audio, Img, Sequence, interpolate, random, spring, staticFile, useCurrentFrame, useVideoConfig, Easing } from "remotion";
import { ThreeCanvas } from "@remotion/three";
import { loadFont as loadOrbitron } from "@remotion/google-fonts/Orbitron";
import { loadFont as loadInter } from "@remotion/google-fonts/Inter";
import geo from "./models-geo.json";

const { fontFamily: TITLE } = loadOrbitron("normal", { weights: ["500", "800"], subsets: ["latin"] });
const { fontFamily: BODY } = loadInter("normal", { weights: ["400", "600"], subsets: ["latin"] });

const TEXTOS = {
  gancho: "Not everything returns from space.",
  gancho2: "Humanity has left hundreds of objects on the Moon.",
  titulo: "SPACE LEGACY",
  subtitulo: "A playable Moon museum, built in Minecraft",
  misiones: [
    { model: "eagle", name: "THE EAGLE", meta: "Apollo 11 · USA · 1969", line: "The half that never came home" },
    { model: "luna2", name: "LUNA 2", meta: "USSR · 1959", line: "The first human object on another world" },
    { model: "surveyor", name: "SURVEYOR 3", meta: "USA · 1967", line: "Visited by astronauts two years later" },
    { model: "lunokhod", name: "LUNOKHOD 1", meta: "USSR · 1970", line: "Lost for 40 years, then found" },
    { model: "lrv", name: "LUNAR ROVER", meta: "Apollo 15–17 · USA", line: "Three cars, still parked" },
    { model: "change4", name: "CHANG'E 4", meta: "China · 2019", line: "First landing on the far side" },
    { model: "vikram", name: "CHANDRAYAAN-3", meta: "India · 2023", line: "Touchdown near the south pole" },
    { model: "slim", name: "SLIM", meta: "Japan · 2024", line: "Landed on its nose. Still a success." },
  ],
  total: 12,
  rasgos: ["Fly there by rocket", "Every machine tells its own story", "12 real missions · 17 3D models · 10 hidden secrets"],
  cierre: "They are still there. Go and listen.",
  equipo: "Mineros del Espacio",
  evento: "NASA Space Apps Challenge",
};

const GOLD = "#f2b53a", INK = "#07080d";
type El = { t: string; a: number[]; b: number[]; rot: { axis: string; angle: number; origin: number[] } | null };
const tiles = geo.tiles as Record<string, number[]>;
const rgb = (t: string, k = 1) => { const c = tiles[t] ?? [200, 200, 200]; return `rgb(${c.map((v) => Math.min(255, Math.round(v * k))).join(",")})`; };

// ───────────── Modelo 3D (los mismos que usa el juego) ─────────────
const ModelMesh: React.FC<{ name: string; spin: number }> = ({ name, spin }) => {
  const els = (geo.models as unknown as Record<string, El[]>)[name];
  let ext = 1, top = 1;
  for (const e of els) { ext = Math.max(ext, Math.abs(e.a[0]), Math.abs(e.b[0]), Math.abs(e.a[2]), Math.abs(e.b[2])); top = Math.max(top, e.b[1]); }
  const s = 15.5 / Math.max(ext, top * 0.62);
  return (
    <group rotation={[0, spin, 0]} scale={[s, s, s]} position={[0, (-top * s) / 2, 0]}>
      {els.map((e, i) => {
        const size = [e.b[0] - e.a[0], e.b[1] - e.a[1], e.b[2] - e.a[2]] as [number, number, number];
        const c = [(e.a[0] + e.b[0]) / 2, (e.a[1] + e.b[1]) / 2, (e.a[2] + e.b[2]) / 2];
        const mat = <meshStandardMaterial color={rgb(e.t)} roughness={e.t === "gold" || e.t === "kapton" ? 0.35 : 0.7} metalness={e.t === "gold" || e.t === "silver" ? 0.55 : 0.15} flatShading />;
        if (!e.rot) return <mesh key={i} position={c as [number, number, number]}><boxGeometry args={size} />{mat}</mesh>;
        const o = e.rot.origin, r = (e.rot.angle * Math.PI) / 180;
        return (
          <group key={i} position={o as [number, number, number]} rotation={[e.rot.axis === "x" ? r : 0, e.rot.axis === "y" ? r : 0, e.rot.axis === "z" ? r : 0]}>
            <mesh position={[c[0] - o[0], c[1] - o[1], c[2] - o[2]]}><boxGeometry args={size} />{mat}</mesh>
          </group>
        );
      })}
      <mesh position={[0, -0.25, 0]}><cylinderGeometry args={[ext * 1.1, ext * 1.1, 0.3, 48]} /><meshBasicMaterial color="#000000" transparent opacity={0.3} /></mesh>
    </group>
  );
};
const Model3D: React.FC<{ name: string; spin: number; size: number; style?: React.CSSProperties }> = ({ name, spin, size, style }) => (
  <div style={{ position: "absolute", width: size, height: size, ...style }}>
    <ThreeCanvas width={size} height={size} camera={{ position: [0, 16, 62], fov: 34 }} gl={{ antialias: true }}>
      <ambientLight intensity={1.1} />
      <directionalLight position={[40, 60, 50]} intensity={3.2} />
      <directionalLight position={[-50, 10, -40]} intensity={1.2} color="#7fb4ff" />
      <group rotation={[0.16, 0, 0]}><ModelMesh name={name} spin={spin} /></group>
    </ThreeCanvas>
  </div>
);

// ───────────── Fondo: estrellas, Tierra y horizonte lunar ─────────────
const Stars: React.FC = () => {
  const f = useCurrentFrame();
  return (
    <AbsoluteFill style={{ background: `radial-gradient(ellipse at 50% 120%, #1a2238 0%, ${INK} 60%)` }}>
      <svg width={1920} height={1080}>
        {new Array(260).fill(0).map((_, i) => {
          const x = random(`x${i}`) * 1920, y = random(`y${i}`) * 1080, r = 0.6 + random(`r${i}`) * 1.9;
          const tw = 0.45 + 0.55 * Math.abs(Math.sin(f / 22 + i * 1.7));
          return <circle key={i} cx={(x + f * 0.12 * (0.3 + random(`p${i}`))) % 1920} cy={y} r={r} fill={i % 9 === 0 ? "#ffd9a0" : "#ffffff"} opacity={tw * (0.35 + random(`o${i}`) * 0.65)} />;
        })}
      </svg>
    </AbsoluteFill>
  );
};
const Moon: React.FC<{ rise: number }> = ({ rise }) => (
  <svg width={1920} height={1080} style={{ position: "absolute", top: interpolate(rise, [0, 1], [420, 0]) }}>
    <defs><radialGradient id="mg" cx="50%" cy="0%" r="80%"><stop offset="0%" stopColor="#b9bbc0" /><stop offset="100%" stopColor="#4d4f55" /></radialGradient></defs>
    <ellipse cx={960} cy={1620} rx={1900} ry={800} fill="url(#mg)" />
    {[[300, 930, 110, 20], [820, 990, 170, 28], [1380, 925, 90, 16], [1650, 1000, 140, 24], [560, 1040, 80, 14], [1120, 900, 60, 10]].map(([x, y, w, h], i) => (
      <g key={i}><ellipse cx={x} cy={y} rx={w} ry={h} fill="#3c3e44" opacity={0.55} /><ellipse cx={x} cy={y + h * 0.35} rx={w * 0.92} ry={h * 0.7} fill="#a9abb0" opacity={0.35} /></g>
    ))}
  </svg>
);
const Earth: React.FC<{ x: number; y: number; r: number }> = ({ x, y, r }) => (
  <div style={{ position: "absolute", left: x - r, top: y - r, width: r * 2, height: r * 2, borderRadius: "50%", background: "radial-gradient(circle at 34% 30%, #9fd4ff 0%, #2f78d6 38%, #123a86 70%, #06122e 100%)", boxShadow: "0 0 90px 10px rgba(80,150,255,0.35)", overflow: "hidden" }}>
    <div style={{ position: "absolute", left: "18%", top: "26%", width: "38%", height: "30%", borderRadius: "46% 54% 60% 40%", background: "#3c9a5a", opacity: 0.85 }} />
    <div style={{ position: "absolute", left: "52%", top: "50%", width: "26%", height: "30%", borderRadius: "50% 40% 55% 45%", background: "#4aa868", opacity: 0.8 }} />
    <div style={{ position: "absolute", inset: 0, borderRadius: "50%", background: "radial-gradient(circle at 78% 76%, rgba(0,0,0,0.75) 0%, rgba(0,0,0,0) 58%)" }} />
  </div>
);

const fade = (f: number, a: number, b: number, c: number, d: number) => interpolate(f, [a, b, c, d], [0, 1, 1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
const up = (f: number, from: number, dur = 18) => interpolate(f, [from, from + dur], [40, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp", easing: Easing.out(Easing.cubic) });
const inn = (f: number, from: number, dur = 18) => interpolate(f, [from, from + dur], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });

// ───────────── Escenas ─────────────
const Gancho: React.FC = () => {
  const f = useCurrentFrame();
  const n = Math.floor(interpolate(f, [12, 62], [0, TEXTOS.gancho.length], { extrapolateLeft: "clamp", extrapolateRight: "clamp" }));
  return (
    <AbsoluteFill style={{ justifyContent: "center", alignItems: "center", opacity: fade(f, 0, 8, 104, 120) }}>
      <div style={{ fontFamily: TITLE, fontWeight: 500, fontSize: 76, color: "#fff", letterSpacing: 2 }}>
        {TEXTOS.gancho.slice(0, n)}<span style={{ color: GOLD, opacity: f % 16 < 9 ? 1 : 0 }}>▌</span>
      </div>
      <div style={{ fontFamily: BODY, fontSize: 38, color: "#aab3c5", marginTop: 34, opacity: inn(f, 68), transform: `translateY(${up(f, 68)}px)` }}>{TEXTOS.gancho2}</div>
    </AbsoluteFill>
  );
};

const Titulo: React.FC = () => {
  const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const pop = spring({ frame: f - 4, fps, config: { damping: 14, mass: 0.8 } });
  return (
    <AbsoluteFill style={{ opacity: fade(f, 0, 10, 136, 150) }}>
      <Moon rise={interpolate(f, [0, 40], [0, 1], { extrapolateRight: "clamp", easing: Easing.out(Easing.cubic) })} />
      <Earth x={1640} y={210} r={120} />
      <Model3D name="eagle" spin={f * 0.022 + 0.6} size={860} style={{ right: 60, top: 150, opacity: inn(f, 6, 24) }} />
      <div style={{ position: "absolute", left: 130, top: 330 }}>
        <div style={{ fontFamily: BODY, fontWeight: 600, fontSize: 30, color: GOLD, letterSpacing: 8, opacity: inn(f, 4) }}>{TEXTOS.equipo.toUpperCase()} PRESENTS</div>
        <div style={{ fontFamily: TITLE, fontWeight: 800, fontSize: 150, color: "#fff", lineHeight: 1.05, marginTop: 16, transform: `scale(${0.85 + 0.15 * pop})`, transformOrigin: "left center", textShadow: "0 0 60px rgba(242,181,58,0.35)" }}>
          SPACE<br /><span style={{ color: GOLD }}>LEGACY</span>
        </div>
        <div style={{ fontFamily: BODY, fontSize: 42, color: "#d6dbe6", marginTop: 26, opacity: inn(f, 34), transform: `translateY(${up(f, 34)}px)` }}>{TEXTOS.subtitulo}</div>
      </div>
    </AbsoluteFill>
  );
};

const PER = 37; // fotogramas por misión
const Montaje: React.FC = () => {
  const f = useCurrentFrame();
  const i = Math.min(TEXTOS.misiones.length - 1, Math.floor(f / PER)), lf = f - i * PER, m = TEXTOS.misiones[i];
  const o = fade(lf, 0, 6, PER - 5, PER);
  return (
    <AbsoluteFill style={{ opacity: fade(f, 0, 8, 290, 300) }}>
      <Moon rise={1} />
      <div style={{ position: "absolute", left: 130, top: 120, fontFamily: BODY, fontWeight: 600, fontSize: 30, color: "#aab3c5", letterSpacing: 6 }}>REAL OBJECTS · REAL MISSIONS</div>
      <Model3D name={m.model} spin={-0.85 + lf * 0.022} size={900} style={{ right: 70, top: 110, opacity: o, transform: `scale(${0.92 + 0.08 * inn(lf, 0, 10)})` }} />
      <div style={{ position: "absolute", left: 130, top: 300, opacity: o, transform: `translateX(${interpolate(lf, [0, 10], [-40, 0], { extrapolateRight: "clamp", easing: Easing.out(Easing.cubic) })}px)` }}>
        <div style={{ fontFamily: TITLE, fontWeight: 500, fontSize: 44, color: GOLD }}>{String(i + 1).padStart(2, "0")} <span style={{ color: "#5d6577" }}>/ {TEXTOS.total}</span></div>
        <div style={{ fontFamily: TITLE, fontWeight: 800, fontSize: 104, color: "#fff", lineHeight: 1.05, marginTop: 14, maxWidth: 880 }}>{m.name}</div>
        <div style={{ fontFamily: BODY, fontWeight: 600, fontSize: 40, color: GOLD, marginTop: 18 }}>{m.meta}</div>
        <div style={{ fontFamily: BODY, fontSize: 40, color: "#d6dbe6", marginTop: 12, maxWidth: 820 }}>{m.line}</div>
      </div>
      <div style={{ position: "absolute", left: 130, bottom: 110, display: "flex", gap: 14 }}>
        {new Array(TEXTOS.total).fill(0).map((_, k) => <div key={k} style={{ width: 54, height: 8, borderRadius: 4, background: k <= i ? GOLD : "#3a4152" }} />)}
      </div>
    </AbsoluteFill>
  );
};

const Juego: React.FC = () => {
  const f = useCurrentFrame();
  return (
    <AbsoluteFill style={{ opacity: fade(f, 0, 10, 168, 180) }}>
      <div style={{ position: "absolute", right: 90, top: 215, width: 1010, height: 531, borderRadius: 18, overflow: "hidden", border: `4px solid ${GOLD}`, boxShadow: "0 30px 90px rgba(0,0,0,0.7)", transform: `perspective(1800px) rotateY(-7deg) scale(${interpolate(f, [0, 180], [0.96, 1.03])})`, opacity: inn(f, 4, 16) }}>
        <Img src={staticFile("juego.png")} style={{ width: "100%", height: "100%", objectFit: "cover" }} />
      </div>
      <div style={{ position: "absolute", left: 130, top: 190 }}>
        <div style={{ fontFamily: BODY, fontWeight: 600, fontSize: 30, color: "#aab3c5", letterSpacing: 6 }}>IN THE GAME</div>
        {TEXTOS.rasgos.map((t, k) => (
          <div key={k} style={{ display: "flex", alignItems: "center", gap: 28, marginTop: k === 0 ? 50 : 44, opacity: inn(f, 14 + k * 38), transform: `translateX(${interpolate(f, [14 + k * 38, 32 + k * 38], [-50, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp", easing: Easing.out(Easing.cubic) })}px)` }}>
            <div style={{ width: 16, height: 76, background: GOLD, borderRadius: 4 }} />
            <div style={{ fontFamily: TITLE, fontWeight: 500, fontSize: k === 2 ? 38 : 52, color: "#fff", maxWidth: 640, lineHeight: 1.15 }}>{t}</div>
          </div>
        ))}
      </div>
      <div style={{ position: "absolute", right: 110, bottom: 250, fontFamily: BODY, fontSize: 26, color: "#fff", opacity: 0.75, background: "rgba(0,0,0,0.5)", padding: "8px 18px", borderRadius: 8 }}>Real in-game capture · Minecraft Java 1.21.1 + Ad Astra</div>
    </AbsoluteFill>
  );
};

const Cierre: React.FC = () => {
  const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const pop = spring({ frame: f - 6, fps, config: { damping: 13 } });
  return (
    <AbsoluteFill style={{ opacity: inn(f, 0, 14) * interpolate(f, [138, 150], [1, 0], { extrapolateLeft: "clamp", extrapolateRight: "clamp" }) }}>
      <Moon rise={1} />
      <Earth x={960} y={interpolate(f, [0, 150], [470, 330])} r={150} />
      <AbsoluteFill style={{ alignItems: "center", justifyContent: "center", paddingTop: 150 }}>
        <div style={{ fontFamily: TITLE, fontWeight: 800, fontSize: 138, color: "#fff", transform: `scale(${0.88 + 0.12 * pop})`, textShadow: "0 0 70px rgba(0,0,0,0.9)" }}>SPACE <span style={{ color: GOLD }}>LEGACY</span></div>
        <div style={{ fontFamily: BODY, fontSize: 48, color: "#fff", marginTop: 20, opacity: inn(f, 30), transform: `translateY(${up(f, 30)}px)`, textShadow: "0 0 30px rgba(0,0,0,0.9)" }}>{TEXTOS.cierre}</div>
        <div style={{ fontFamily: BODY, fontWeight: 600, fontSize: 30, color: INK, marginTop: 56, letterSpacing: 4, opacity: inn(f, 58), background: GOLD, padding: "12px 30px", borderRadius: 10 }}>{TEXTOS.equipo.toUpperCase()} · {TEXTOS.evento.toUpperCase()}</div>
      </AbsoluteFill>
    </AbsoluteFill>
  );
};

export const Presentacion: React.FC = () => (
  <AbsoluteFill style={{ background: INK }}>
    <Stars />
    <Sequence from={0} durationInFrames={120}><Gancho /></Sequence>
    <Sequence from={120} durationInFrames={150}><Titulo /></Sequence>
    <Sequence from={270} durationInFrames={300}><Montaje /></Sequence>
    <Sequence from={570} durationInFrames={180}><Juego /></Sequence>
    <Sequence from={750} durationInFrames={150}><Cierre /></Sequence>
    <Audio src={staticFile("musica.wav")} volume={0.9} />
  </AbsoluteFill>
);
