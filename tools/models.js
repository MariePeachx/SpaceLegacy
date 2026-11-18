// SPACE LEGACY — modelos 3D de los objetos reales (formato de modelos de Minecraft, hechos por código)
// Uso:  node tools/models.js     → escribe el paquete de recursos y una hoja de vista previa
const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

const ROOT = path.join(__dirname, '..');
const RP = path.join(ROOT, 'resourcepack', 'SpaceLegacyRP');
fs.rmSync(RP, { recursive: true, force: true });
const w = (rel, content) => { const p = path.join(RP, rel); fs.mkdirSync(path.dirname(p), { recursive: true }); fs.writeFileSync(p, Buffer.isBuffer(content) ? content : (typeof content === 'string' ? content : JSON.stringify(content))); };

// ───────────── PNG ─────────────
function png(wd, ht, rgba) {
  const chunk = (type, data) => { const len = Buffer.alloc(4); len.writeUInt32BE(data.length); const td = Buffer.concat([Buffer.from(type), data]); const crc = Buffer.alloc(4); crc.writeUInt32BE(zlib.crc32(td) >>> 0); return Buffer.concat([len, td, crc]); };
  const ihdr = Buffer.alloc(13); ihdr.writeUInt32BE(wd, 0); ihdr.writeUInt32BE(ht, 4); ihdr[8] = 8; ihdr[9] = 6;
  const raw = Buffer.alloc((wd * 4 + 1) * ht);
  for (let y = 0; y < ht; y++) { raw[y * (wd * 4 + 1)] = 0; rgba.copy(raw, y * (wd * 4 + 1) + 1, y * wd * 4, (y + 1) * wd * 4); }
  return Buffer.concat([Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]), chunk('IHDR', ihdr), chunk('IDAT', zlib.deflateSync(raw)), chunk('IEND', Buffer.alloc(0))]);
}

// ───────────── Texturas: un atlas de 4x4 materiales ─────────────
const TILES = {
  gold: [[214, 164, 48], 'foil'], black: [[28, 28, 32], 'foil'], silver: [[176, 180, 186], 'plain'], dark: [[70, 72, 78], 'plain'],
  white: [[236, 236, 232], 'plain'], solar: [[30, 52, 120], 'grid'], kapton: [[196, 112, 40], 'foil'], red: [[190, 40, 36], 'plain'],
  mesh: [[92, 92, 96], 'check'], gray: [[138, 140, 144], 'plain'], copper: [[150, 96, 60], 'plain'], yellow: [[226, 196, 60], 'plain'],
  engine: [[48, 44, 44], 'plain'], goldmesh: [[200, 170, 80], 'check'], ice: [[150, 200, 230], 'plain'], green: [[70, 150, 60], 'plain'],
};
const TNAMES = Object.keys(TILES);
const AT = 64, atlas = Buffer.alloc(AT * AT * 4);
let s = 7; const rnd = () => ((s = (s * 1103515245 + 12345) & 0x7fffffff) / 0x7fffffff);
TNAMES.forEach((name, i) => {
  const [[r, g, b], kind] = TILES[name]; const ox = (i % 4) * 16, oy = Math.floor(i / 4) * 16;
  for (let y = 0; y < 16; y++) for (let x = 0; x < 16; x++) {
    let k = 1 + (rnd() - 0.5) * 0.08;
    if (kind === 'foil') k = 1 + (rnd() - 0.5) * 0.34 + ((x + y * 2) % 7 === 0 ? 0.12 : 0);
    if (kind === 'grid') k = (x % 4 === 0 || y % 4 === 0) ? 1.9 : 1 + (rnd() - 0.5) * 0.1;
    if (kind === 'check') k = ((x + y) % 2 ? 0.72 : 1.12);
    if (x === 0 || y === 0 || x === 15 || y === 15) k *= 0.86;
    const o = ((oy + y) * AT + ox + x) * 4;
    atlas[o] = Math.min(255, r * k); atlas[o + 1] = Math.min(255, g * k); atlas[o + 2] = Math.min(255, b * k); atlas[o + 3] = 255;
  }
});
w('assets/spacelegacy/textures/item/atlas.png', png(AT, AT, atlas));

// ───────────── Constructor de modelos ─────────────
// Coordenadas de autor: X y Z de -24 a 24, Y de 0 (suelo) a 48. El modelo completo mide 3 bloques a escala 1.
const GY = -11.8; // el suelo del modelo queda 19,8 unidades bajo su centro
class Model {
  constructor(name, size, note) { this.name = name; this.size = size; this.note = note; this.el = []; }
  box(tile, x1, y1, z1, x2, y2, z2, rot) {
    const a = [Math.min(x1, x2), Math.min(y1, y2), Math.min(z1, z2)], b = [Math.max(x1, x2), Math.max(y1, y2), Math.max(z1, z2)];
    this.el.push({ tile, a, b, rot }); return this;
  }
  cyl(tile, axis, c1, c2, r, lo, hi) { // prisma octogonal: axis 'y' → centro (x,z); axis 'z' → centro (x,y)
    const k = 0.4142 * r;
    for (let i = 0; i < 4; i++) {
      const e = i * 0.03, l = lo - e, h = hi + e;
      const wide = i === 1 ? k : r, thin = i === 1 ? r : k;
      const rot = i >= 2 ? { axis, angle: i === 2 ? 45 : -45, origin: axis === 'y' ? [c1, 0, c2] : [c1, c2, 0] } : undefined;
      if (axis === 'y') this.box(tile, c1 - wide, l, c2 - thin, c1 + wide, h, c2 + thin, rot);
      else this.box(tile, c1 - wide, c2 - thin, l, c1 + wide, c2 + thin, h, rot);
    }
    return this;
  }
  // barra que cuelga (len>0) o sube (len<0) desde una articulación y se inclina sobre un eje
  strut(tile, [x, y, z], len, t, axis, angle, t2 = t) {
    const tx = axis === 'z' ? t : t2, tz = axis === 'z' ? t2 : t;
    return this.box(tile, x - tx / 2, y - len, z - tz / 2, x + tx / 2, y, z + tz / 2, angle ? { axis, angle, origin: [x, y, z] } : undefined);
  }
  fit() { // encoge el modelo lo justo para caber en los límites de Minecraft y compensa con la escala
    let mh = 0, top = 0, bot = 0;
    for (const e of this.el) { mh = Math.max(mh, Math.abs(e.a[0]), Math.abs(e.b[0]), Math.abs(e.a[2]), Math.abs(e.b[2])); top = Math.max(top, e.b[1]); bot = Math.min(bot, e.a[1]); }
    const f = Math.min(1, 24 / mh, 43.8 / top, bot < -4.2 ? -4.2 / bot : 1);
    if (f < 1) { for (const e of this.el) { e.a = e.a.map((v) => v * f); e.b = e.b.map((v) => v * f); if (e.rot) e.rot = { ...e.rot, origin: e.rot.origin.map((v) => v * f) }; } this.size /= f; }
    return this;
  }
  json() {
    const elements = this.el.map(({ tile, a, b, rot }) => {
      const i = TNAMES.indexOf(tile); if (i < 0) throw new Error('material desconocido: ' + tile);
      const from = [8 + a[0], GY + a[1], 8 + a[2]], to = [8 + b[0], GY + b[1], 8 + b[2]];
      for (const v of [...from, ...to]) if (v < -16.001 || v > 32.001) throw new Error(`${this.name}: fuera de límites ${from} ${to}`);
      const uv = [(i % 4) * 4 + 0.25, Math.floor(i / 4) * 4 + 0.25, (i % 4) * 4 + 3.75, Math.floor(i / 4) * 4 + 3.75];
      const faces = {}; for (const f of ['north', 'south', 'east', 'west', 'up', 'down']) faces[f] = { uv, texture: '#0' };
      const e = { from: from.map((v) => +v.toFixed(3)), to: to.map((v) => +v.toFixed(3)), faces };
      if (rot) e.rotation = { angle: rot.angle, axis: rot.axis, origin: [8 + rot.origin[0], GY + rot.origin[1], 8 + rot.origin[2]] };
      return e;
    });
    return { textures: { 0: 'spacelegacy:item/atlas', particle: 'spacelegacy:item/atlas' }, elements, display: {} };
  }
}
const models = [];
const M = (name, size, note) => { const m = new Model(name, size, note); models.push(m); return m; };
const four = (f) => { f('z', 1, (d) => [d, 0]); f('z', -1, (d) => [-d, 0]); f('x', -1, (d) => [0, d]); f('x', 1, (d) => [0, -d]); };

// 1 · Etapa de descenso del módulo lunar Eagle (9,4 m entre patas, 3,2 m de alto)
{ const m = M('eagle', 9.6, 'Apolo 11');
  m.cyl('gold', 'y', 0, 0, 10.5, 7.5, 12.5).cyl('black', 'y', 0, 0, 10.6, 12.5, 15).cyl('gold', 'y', 0, 0, 10.4, 15, 16.2).cyl('silver', 'y', 0, 0, 8, 16.2, 16.8);
  m.cyl('engine', 'y', 0, 0, 3.6, 2.2, 5).cyl('engine', 'y', 0, 0, 2.4, 5, 7.5);
  four((axis, sgn, at) => { const [x, z] = at(10.2); const [px, pz] = at(21.2);
    m.strut('gold', [x, 12.5, z], 16.2, 1.3, axis, 45 * sgn);
    m.cyl('gold', 'y', px, pz, 2.6, 0, 0.9); });
  m.strut('silver', [10.6, 13.4, 0], 14.5, 0.5, 'z', 45, 3.2); // escalera
  m.box('silver', 10, 13, -2.2, 14, 13.6, 2.2); // plataforma de salida
  m.box('kapton', -3, 9, -10.9, 3, 12, -10.3).box('kapton', -3, 9, 10.3, 3, 12, 10.9); }

// 2 · Vehículo lunar LRV (3,1 m de largo)
{ const m = M('lrv', 3.2, 'Apolo 15-17');
  for (const x of [-16, 16]) for (const z of [-13.5, 13.5]) { m.cyl('mesh', 'z', x, 6, 6, z - 1.8, z + 1.8); m.box('kapton', x - 6, 12.4, z - 2, x + 6, 13, z + 2); }
  m.box('silver', -20, 6, -9, 20, 8, 9).box('dark', -21, 5.2, -1, 21, 6, 1);
  for (const z of [-5.5, 5.5]) { m.box('white', -6, 8, z - 3.4, 1, 9.4, z + 3.4).box('white', -7, 8, z - 3.4, -6, 16, z + 3.4); }
  m.box('dark', 5, 8, -2.5, 7, 14, 2.5).box('gray', 4.6, 12.5, -1, 5, 14, 1);
  m.box('silver', 19, 8, -0.5, 20, 21, 0.5).cyl('goldmesh', 'y', 19.5, 0, 6.5, 21, 21.6);
  m.box('dark', 17.5, 8, 6, 20.5, 12.5, 9).box('engine', 20.5, 10, 6.8, 22, 11.8, 8.2);
  m.box('gray', -22, 8, -7.5, -13, 11.5, 7.5).box('silver', -21, 11.5, -6, -19.5, 17, -4.5).box('silver', -21, 11.5, 4.5, -19.5, 16, 6); }

// 3 · Estación central del ALSEP
{ const m = M('alsep', 2.4, 'Apolo 12-17');
  m.box('gray', -8, 0, -8, 8, 2, 8).box('white', -6.5, 2, -6.5, 6.5, 12, 6.5).box('silver', -8.5, 12, -8.5, 8.5, 12.8, 8.5);
  m.box('gold', -6.6, 4, -3, -6.5, 10, 3).box('gold', 6.5, 4, -3, 6.6, 10, 3);
  m.cyl('gold', 'y', 0, 0, 1.4, 12.8, 30).cyl('silver', 'y', 0, 0, 2.2, 30, 31);
  m.box('kapton', 8.5, 0, -1, 24, 0.4, 1).box('kapton', -1, 0, 8.5, 1, 0.4, 24); }

// 4 · Generador nuclear SNAP-27
{ const m = M('rtg', 1.2, 'Apolo 12-17');
  m.box('gray', -13, 0, -13, 13, 4, 13).cyl('dark', 'y', 0, 0, 8, 4, 30).cyl('engine', 'y', 0, 0, 5, 30, 32);
  for (const [axis, angle] of [[null, 0], ['y', 45], ['y', -45]]) m.box('silver', -13, 6, -0.5, 13, 28, 0.5, angle ? { axis, angle, origin: [0, 0, 0] } : undefined);
  m.box('silver', -0.5, 6, -13, 0.5, 28, 13); }

// 5 · Surveyor 3 (3 m de alto)
{ const m = M('surveyor', 4.3, 'EE. UU., 1967');
  m.box('silver', -5, 7, -5, 5, 14, 5).cyl('white', 'y', -7, 4, 3, 7, 13).cyl('white', 'y', -7, -4, 3, 7, 13);
  m.box('silver', 0, 7, -0.6, 22, 8.2, 0.6).box('silver', 21.4, 1, -0.6, 22.6, 8, 0.6).cyl('gray', 'y', 22, 0, 2.6, 0, 1);
  for (const sg of [1, -1]) { m.box('silver', -22, 7, -0.6, 0, 8.2, 0.6, { axis: 'y', angle: 45 * sg, origin: [0, 0, 0] });
    m.box('silver', -16.2, 1, 15 * sg - 0.6, -15, 8, 15 * sg + 0.6).cyl('gray', 'y', -15.6, 15.6 * sg, 2.6, 0, 1); }
  m.box('silver', -0.7, 14, -0.7, 0.7, 31, 0.7);
  m.box('solar', -11, 31, -5, -1, 31.7, 5).box('silver', 1, 31, -5, 11, 31.7, 5);
  m.box('dark', 2.5, 14, 2.5, 5.5, 20, 5.5).box('engine', 5.5, 17, 3.2, 7, 19, 4.8);
  m.box('silver', 5, 9, -3, 17, 9.8, -2.2).box('dark', 17, 6, -3.6, 19, 9.8, -1.6); }

// 6 · Luna 2 (esfera de 0,9 m)
{ const m = M('luna2', 2.4, 'URSS, 1959');
  m.cyl('silver', 'y', 0, 0, 6, 3, 6).cyl('silver', 'y', 0, 0, 9.2, 6, 18).cyl('silver', 'y', 0, 0, 6, 18, 21).cyl('dark', 'y', 0, 0, 9.4, 11.5, 12.5);
  for (const [axis, sg] of [['z', 1], ['z', -1], ['x', 1], ['x', -1]]) m.strut('gray', [0, 20, 0], -16, 0.6, axis, 22.5 * sg);
  m.box('gray', 9, 11.6, -0.4, 24, 12.4, 0.4).box('dark', 22, 11, -1, 24, 13, 1);
  m.cyl('gray', 'y', 0, 0, 3, 0, 3); }

// 7 · Lunokhod 1 (2,3 m)
{ const m = M('lunokhod', 3.2, 'URSS, 1970');
  for (const x of [-12.6, -4.2, 4.2, 12.6]) for (const z of [-12, 12]) m.cyl('mesh', 'z', x, 4, 4, z - 1.6, z + 1.6);
  m.box('dark', -14, 3.4, -10, 14, 4.6, 10);
  m.cyl('silver', 'y', 0, 0, 12, 7, 14).cyl('gray', 'y', 0, 0, 12.8, 14, 15).cyl('white', 'y', 0, 0, 11, 15, 15.4);
  m.box('solar', -15.2, 15, -10, -14.4, 33, 10, { axis: 'z', angle: 22.5, origin: [-14, 15, 0] });
  m.box('dark', 11, 9, -7, 13.5, 12, -4).box('dark', 11, 9, 4, 13.5, 12, 7).box('ice', 12, 10, -2.2, 14.5, 13, 2.2);
  m.cyl('gold', 'y', 6, -6, 1.6, 15, 25).strut('gray', [7, 15, 6], -14, 0.6, 'z', 22.5); }

// 8 · Módulo Vikram (Chandrayaan-3)
{ const m = M('vikram', 3.2, 'India, 2023');
  m.box('gold', -13, 8, -13, 13, 26, 13).box('silver', -11, 26, -11, 11, 27, 11);
  m.box('solar', -9, 10, -13.5, 9, 24, -13).box('solar', -9, 10, 13, 9, 24, 13.5).box('solar', -13.5, 10, -9, -13, 24, 9);
  for (const x of [-16, 16]) for (const z of [-16, 16]) { m.box('silver', x - 0.8, 1, z - 0.8, x + 0.8, 11, z + 0.8).cyl('gray', 'y', x, z, 3, 0, 1).box('silver', Math.min(x, x * 0.8), 9, Math.min(z, z * 0.8), Math.max(x, x * 0.8), 10, Math.max(z, z * 0.8)); }
  m.box('gray', 13, 7.4, -4, 24, 8, 4, { axis: 'z', angle: -22.5, origin: [13, 8, 0] });
  m.cyl('engine', 'y', 0, 0, 3, 4, 8).cyl('goldmesh', 'y', -6, 6, 4, 27, 27.6).box('silver', -6.5, 27, 5.5, -5.5, 31, 6.5); }

// 9 · Rover Pragyan
{ const m = M('pragyan', 1.3, 'India, 2023');
  for (const x of [-14, 0, 14]) for (const z of [-11, 11]) m.cyl('mesh', 'z', x, 4.5, 4.5, z - 1.8, z + 1.8);
  m.box('dark', -15, 4, -9, 15, 5, 9).box('gold', -12, 9, -8, 12, 17, 8).box('silver', -10, 5, -1, 10, 9, 1);
  m.box('solar', -12, 17, 7, 12, 34, 8).box('silver', 10, 17, -3, 12, 26, -1).box('dark', 9, 26, -4.5, 13, 29, 0.5).box('ice', 13, 27, -4, 13.4, 28.4, -2.6).box('ice', 13, 27, -1.4, 13.4, 28.4, 0); }

// 10 · Módulo Chang'e 4
{ const m = M('change4', 4.8, 'China, 2019');
  m.box('gold', -11, 8, -11, 11, 19, 11).box('silver', -10, 19, -10, 10, 20, 10).box('red', 11, 12.5, -3, 11.4, 16.5, 3);
  four((axis, sgn, at) => { const [x, z] = at(10.6); const [px, pz] = at(22.5); m.strut('silver', [x, 14, z], 17.5, 1.2, axis, 45 * sgn).cyl('gray', 'y', px, pz, 2.8, 0, 1); });
  m.box('solar', -9, 20, 11, 9, 20.7, 24).box('solar', -9, 20, -24, 9, 20.7, -11);
  m.cyl('engine', 'y', 0, 0, 3.4, 3.5, 8).cyl('silver', 'y', -5, 5, 2.2, 20, 24).box('green', -6, 24, 4, -4, 25.6, 6).box('green', -5.4, 25.6, 4.6, -4.6, 27, 5.4);
  m.box('gray', 11, 7.4, -3.5, 23, 8, 3.5, { axis: 'z', angle: -22.5, origin: [11, 8, 0] }); }

// 11 · Rover Yutu-2
{ const m = M('yutu2', 1.8, 'China, 2019');
  for (const x of [-14, 0, 14]) for (const z of [-11.5, 11.5]) m.cyl('mesh', 'z', x, 4.5, 4.5, z - 1.8, z + 1.8);
  m.box('dark', -15, 4, -9.5, 15, 5, 9.5).box('gold', -12, 9, -8.5, 12, 17, 8.5).box('silver', -10, 5, -1, 10, 9, 1);
  m.box('solar', -11, 17, 8.5, 11, 17.7, 24).box('solar', -11, 17, -24, 11, 17.7, -8.5);
  m.box('silver', 9, 17, -1, 11, 33, 1).box('white', 7, 33, -3.5, 13, 37, 3.5).box('dark', 13, 34, -2.5, 13.5, 36, -0.8).box('dark', 13, 34, 0.8, 13.5, 36, 2.5).cyl('goldmesh', 'y', -8, 0, 3.4, 22, 22.6).box('silver', -8.4, 17.7, -0.4, -7.6, 22, 0.4); }

// 12 · SLIM, apoyada sobre el morro, con una sola tobera
{ const m = M('slim', 3.0, 'Japón, 2024');
  m.box('gold', -9, 2, -12, 9, 36, 12).box('silver', -7, 0, -10, 7, 2, 10).box('solar', 9, 6, -11, 9.6, 34, 11).box('black', -9.5, 8, -8, -9, 30, 8);
  m.cyl('engine', 'y', 0, -6, 4.2, 37, 42).cyl('engine', 'y', 0, -6, 2.6, 36, 37).cyl('dark', 'y', 0, 6, 2.2, 36, 37);
  for (const z of [-9, 0, 9]) m.box('silver', -13, 30, z - 0.7, -9.5, 31.4, z + 0.7).cyl('gray', 'y', -14, z, 2, 29, 32); }

// 13 · SORA-Q (ampliada: la real cabe en una mano)
{ const m = M('soraq', 0.5, 'Japón, 2024');
  m.cyl('silver', 'y', 0, 0, 12, 4, 10).cyl('silver', 'y', 0, 0, 19, 10, 34).cyl('silver', 'y', 0, 0, 12, 34, 40).cyl('dark', 'y', 0, 0, 19.4, 21, 23).box('ice', 18.5, 26, -3, 19.6, 30, 3); }

// 14 · Restos de Beresheet
{ const m = M('beresheet', 2.6, 'Israel, 2019');
  m.cyl('gold', 'y', 0, 0, 13, 3, 13).cyl('black', 'y', 2, 1, 9, 13, 15).cyl('silver', 'y', -8, -8, 4, 2, 10).cyl('silver', 'y', 9, 7, 4, 1, 8);
  m.strut('silver', [12, 10, 0], 14, 1, 'z', 45).strut('silver', [-12, 9, 0], 12, 1, 'z', -45).box('silver', -4, 0, 14, 12, 1, 15.2).box('gold', 16, 0, -14, 21, 2.5, -10).box('gold', -22, 0, 8, -18, 2, 13).box('dark', -18, 0, -16, -15, 1.5, -12);
  m.strut('gray', [3, 15, 2], -12, 0.7, 'x', 22.5).cyl('engine', 'y', 0, 0, 4, 0, 3); }

// 15 · Lunar Prospector
{ const m = M('prospector', 4.8, 'NASA, 1999');
  m.cyl('solar', 'y', 0, 0, 7, 1, 13).cyl('silver', 'y', 0, 0, 7.2, 0, 1).cyl('silver', 'y', 0, 0, 7.2, 13, 13.8).cyl('gray', 'y', 0, 0, 1, 13.8, 22).cyl('white', 'y', 0, 0, 2, 22, 24);
  m.box('gray', 7, 6, -0.4, 23, 6.8, 0.4).box('dark', 21, 5, -1.4, 24, 8, 1.4);
  for (const sg of [1, -1]) m.box('gray', -23, 6, -0.4, -7, 6.8, 0.4, { axis: 'y', angle: 45 * sg, origin: [0, 0, 0] }).box('dark', -17.5, 5, 14.4 * sg - 1.4, -14.5, 8, 14.4 * sg + 1.4); }

// 16 · El Astronauta Caído y su placa (ampliado: la figura real mide 8,5 cm)
{ const m = M('caido', 1.0, 'Apolo 15');
  m.box('silver', -6, 0, -4, 6, 3, 4).cyl('silver', 'y', 9.5, 0, 3.2, 0, 3.6).box('silver', -20, 0, -4, -6, 2.6, -0.6).box('silver', -20, 0, 0.6, -6, 2.6, 4).box('silver', -4, 0, 4, 5, 2.4, 6.4).box('silver', -4, 0, -6.4, 5, 2.4, -4);
  m.box('gray', -10, 0, 11, 10, 13, 12.4).box('dark', -8.5, 2, 10.8, 8.5, 11.5, 11); }

// 17 · Retrorreflector láser
{ const m = M('lrrr', 1.0, 'Apolo 11');
  m.box('gray', -11, 0, -11, 11, 2, 11).box('silver', -10, 2, -10, 10, 9, 10, { axis: 'x', angle: 22.5, origin: [0, 2, 0] });
  for (const x of [-7.5, -2.5, 2.5, 7.5]) for (const z of [-7.5, -2.5, 2.5, 7.5]) m.box('ice', x - 2, 9, z - 2, x + 2, 9.3, z + 2, { axis: 'x', angle: 22.5, origin: [0, 2, 0] }); }

models.forEach((m) => m.fit());
// ───────────── Paquete de recursos ─────────────
w('pack.mcmeta', { pack: { pack_format: 34, description: 'SPACE LEGACY — modelos 3D y cielo lunar' } });
models.forEach((m) => w(`assets/spacelegacy/models/item/${m.name}.json`, m.json()));
w('assets/minecraft/models/item/paper.json', { parent: 'minecraft:item/generated', textures: { layer0: 'minecraft:item/paper' },
  overrides: models.map((m, i) => ({ predicate: { custom_model_data: i + 1 }, model: `spacelegacy:item/${m.name}` })) });
w('assets/spacelegacy/lang/es_es.json', { 'planet.spacelegacy.moon': 'Luna' });
w('assets/spacelegacy/lang/en_us.json', { 'planet.spacelegacy.moon': 'Moon' });
// Cielo de Ad Astra (la Tierra y las estrellas) para nuestra dimensión
const aa = fs.readdirSync(path.join(ROOT, 'mods')).find((f) => f.startsWith('adastra'));
if (aa) {
  const { execFileSync } = require('child_process');
  const sky = JSON.parse(execFileSync('unzip', ['-p', path.join(ROOT, 'mods', aa), 'assets/ad_astra/planet_renderers/moon.json']).toString());
  sky.dimension = 'spacelegacy:moon';
  w('assets/spacelegacy/planet_renderers/moon.json', sky);
}
fs.writeFileSync(path.join(__dirname, 'models.json'), JSON.stringify(Object.fromEntries(models.map((m, i) => [m.name, { cmd: i + 1, scale: +(m.size / 3).toFixed(3), lift: +(m.size / 3 * 19.8 / 16).toFixed(3), size: +m.size.toFixed(2), parts: m.el.length }])), null, 1));

// ───────────── Vista previa (render propio, para revisar las formas) ─────────────
const avg = TNAMES.map((n) => TILES[n][0]);
const CELL = 300, COLS = 6, ROWS = Math.ceil(models.length / COLS);
const img = Buffer.alloc(CELL * COLS * CELL * ROWS * 4); const zb = new Float32Array(CELL * COLS * CELL * ROWS).fill(-1e9);
for (let i = 0; i < img.length; i += 4) { img[i] = 14; img[i + 1] = 14; img[i + 2] = 20; img[i + 3] = 255; }
const rotP = (p, rot) => { if (!rot) return p; const t = rot.angle * Math.PI / 180, c = Math.cos(t), sn = Math.sin(t); const [x, y, z] = [p[0] - rot.origin[0], p[1] - rot.origin[1], p[2] - rot.origin[2]];
  const q = rot.axis === 'x' ? [x, y * c - z * sn, y * sn + z * c] : rot.axis === 'y' ? [x * c + z * sn, y, -x * sn + z * c] : [x * c - y * sn, x * sn + y * c, z];
  return [q[0] + rot.origin[0], q[1] + rot.origin[1], q[2] + rot.origin[2]]; };
const yaw = -0.62, pit = 0.42;
const view = ([x, y, z]) => { const x1 = x * Math.cos(yaw) + z * Math.sin(yaw), z1 = -x * Math.sin(yaw) + z * Math.cos(yaw); return [x1, y * Math.cos(pit) - z1 * Math.sin(pit), y * Math.sin(pit) + z1 * Math.cos(pit)]; };
const L = [0.35, 0.8, 0.5];
models.forEach((m, mi) => {
  const ox = (mi % COLS) * CELL, oy = Math.floor(mi / COLS) * CELL, sc = CELL / 62;
  const tri = (a, b, c, col) => {
    const minx = Math.max(ox, Math.floor(Math.min(a[0], b[0], c[0]))), maxx = Math.min(ox + CELL - 1, Math.ceil(Math.max(a[0], b[0], c[0])));
    const miny = Math.max(oy, Math.floor(Math.min(a[1], b[1], c[1]))), maxy = Math.min(oy + CELL - 1, Math.ceil(Math.max(a[1], b[1], c[1])));
    const d = (b[1] - c[1]) * (a[0] - c[0]) + (c[0] - b[0]) * (a[1] - c[1]); if (Math.abs(d) < 1e-9) return;
    for (let y = miny; y <= maxy; y++) for (let x = minx; x <= maxx; x++) {
      const w1 = ((b[1] - c[1]) * (x - c[0]) + (c[0] - b[0]) * (y - c[1])) / d, w2 = ((c[1] - a[1]) * (x - c[0]) + (a[0] - c[0]) * (y - c[1])) / d, w3 = 1 - w1 - w2;
      if (w1 < -0.001 || w2 < -0.001 || w3 < -0.001) continue;
      const z = w1 * a[2] + w2 * b[2] + w3 * c[2], k = y * CELL * COLS + x; if (z <= zb[k]) continue; zb[k] = z;
      img[k * 4] = col[0]; img[k * 4 + 1] = col[1]; img[k * 4 + 2] = col[2]; }
  };
  for (const e of m.el) {
    const [a, b] = [e.a, e.b]; const P = (i, j, k) => rotP([i ? b[0] : a[0], j ? b[1] : a[1], k ? b[2] : a[2]], e.rot);
    const faces = [[[0, 0, 0], [0, 1, 0], [0, 1, 1], [0, 0, 1]], [[1, 0, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1]], [[0, 0, 0], [1, 0, 0], [1, 0, 1], [0, 0, 1]], [[0, 1, 0], [1, 1, 0], [1, 1, 1], [0, 1, 1]], [[0, 0, 0], [1, 0, 0], [1, 1, 0], [0, 1, 0]], [[0, 0, 1], [1, 0, 1], [1, 1, 1], [0, 1, 1]]];
    for (const f of faces) {
      const w3 = f.map((c) => P(...c)); const u = w3[1].map((v, i) => v - w3[0][i]), v2 = w3[3].map((v, i) => v - w3[0][i]);
      let n = [u[1] * v2[2] - u[2] * v2[1], u[2] * v2[0] - u[0] * v2[2], u[0] * v2[1] - u[1] * v2[0]]; const ln = Math.hypot(...n) || 1; n = n.map((x) => x / ln);
      const sh = 0.45 + 0.55 * Math.abs(n[0] * L[0] + n[1] * L[1] + n[2] * L[2]); const col = avg[TNAMES.indexOf(e.tile)].map((c) => Math.min(255, c * sh));
      const p = w3.map((q) => { const [vx, vy, vz] = view([q[0], q[1] - 20, q[2]]); return [ox + CELL / 2 + vx * sc, oy + CELL / 2 - vy * sc, vz]; });
      tri(p[0], p[1], p[2], col); tri(p[0], p[2], p[3], col);
    }
  }
});
fs.writeFileSync(path.join(ROOT, 'vista-previa-modelos.png'), png(CELL * COLS, CELL * ROWS, img));
console.log(`${models.length} modelos: ` + models.map((m, i) => `${i + 1}.${m.name}(${m.el.length})`).join(' '));

// Geometría para el vídeo de presentación (video/src/models-geo.json)
{ const r3 = (v) => +v.toFixed(3); const vdir = path.join(ROOT, 'video', 'src');
  if (fs.existsSync(vdir)) fs.writeFileSync(path.join(vdir, 'models-geo.json'), JSON.stringify({
    tiles: Object.fromEntries(TNAMES.map((n) => [n, TILES[n][0]])),
    models: Object.fromEntries(models.map((m) => [m.name, m.el.map((e) => ({ t: e.tile, a: e.a.map(r3), b: e.b.map(r3), rot: e.rot ? { axis: e.rot.axis, angle: e.rot.angle, origin: e.rot.origin.map(r3) } : null }))])),
  })); }
