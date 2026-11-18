// SPACE LEGACY — generador del datapack (Minecraft Java 1.21.1, con o sin Ad Astra)
// Uso:  node tools/build.js
const fs = require('fs');
const path = require('path');
const { missions, secrets, SOURCES } = require('./content.js');

const OUT = path.join(__dirname, '..', 'datapack', 'SpaceLegacy');
const NS = 'spacelegacy';
const G = 224; // altura a la que se pisa en la Luna (el bloque de suelo es G-1)
const AUTHOR = 'Mineros del Espacio';
const TOTAL = missions.length, TOTAL_S = secrets.length;
const VERSION = 3;

fs.rmSync(OUT, { recursive: true, force: true });
let fileCount = 0;
function w(rel, content) {
  const p = path.join(OUT, rel);
  fs.mkdirSync(path.dirname(p), { recursive: true });
  fs.writeFileSync(p, typeof content === 'string' ? content : JSON.stringify(content, null, 2), 'utf8');
  fileCount++;
}
const fn = (name, lines) => w(`data/${NS}/function/${name}.mcfunction`, lines.flat(Infinity).join('\n') + '\n');
const J = (o) => JSON.stringify(o);
const snbt = (s) => "'" + s.replace(/\\/g, '\\\\').replace(/'/g, "\\'") + "'";
const inMoon = (cmd) => `execute in ${NS}:moon run ${cmd}`;
const pad2 = (n) => String(n).padStart(2, '0');
const Y = (dy) => G + dy;

const ID_TF = 'transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:';
function label(x, y, z, comp, tags = [], extra = '') {
  return `summon text_display ${x} ${y} ${z} {billboard:"center",alignment:"center",Tags:[${['sl', ...tags].map((t) => `"${t}"`).join(',')}],text:${snbt(J(comp))}${extra}}`;
}
const interaction = (x, y, z, wd, h, name) => `summon interaction ${x} ${y} ${z} {width:${wd}f,height:${h}f,response:1b,Tags:["sl","sl_i_${name}"]}`;
const itemFlat = (x, z, item, s = 1, y = G + 0.05) => `summon item_display ${x} ${y} ${z} {Tags:["sl"],billboard:"fixed",item_display:"none",item:{id:"minecraft:${item}",count:1},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[${s}f,${s}f,${s}f]}}`;
const itemUp = (x, y, z, item, s = 1) => `summon item_display ${x} ${y} ${z} {Tags:["sl"],item_display:"none",billboard:"vertical",item:{id:"minecraft:${item}",count:1},${ID_TF}[${s}f,${s}f,${s}f]}}`;

// Voces
const eco = (...parts) => ['', { text: 'ECO › ', color: 'aqua', bold: true }, ...parts.map((p) => (typeof p === 'string' ? { text: p, color: 'white' } : p))];
const ecoCmd = (who, ...parts) => `tellraw ${who} ${J(eco(...parts))}`;
const btn = (text, cmd) => ({ text: `[${text}]`, color: 'green', underlined: true, clickEvent: { action: 'run_command', value: cmd } });
const firework = (color, shape = 'large_ball') => `summon firework_rocket ~ ~2 ~ {LifeTime:${12 + Math.floor(color % 9)},FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"${shape}",colors:[I;${color}],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}`;

// ───────────────────────── pack.mcmeta y etiquetas ─────────────────────────
w('pack.mcmeta', { pack: { pack_format: 48, description: 'SPACE LEGACY — Not everything returns from space. Por Mineros del Espacio' } });
w('data/minecraft/tags/function/load.json', { values: [`${NS}:load`] });
w('data/minecraft/tags/function/tick.json', { values: [`${NS}:tick`] });
// Funciones que solo existen si Ad Astra está instalado (si no, se ignoran sin romper nada)
for (const t of ['detect', 'suit', 'refill', 'kit', 'decorate']) {
  w(`data/${NS}/tags/function/adastra_${t}.json`, { values: [{ id: `${NS}:adastra/${t}`, required: false }] });
}

// ───────────────────────── Dimensión lunar ─────────────────────────
w(`data/${NS}/dimension_type/moon.json`, {
  ultrawarm: false, natural: false, coordinate_scale: 1.0,
  has_skylight: true, has_ceiling: false, ambient_light: 0.0,
  fixed_time: 6000,
  monster_spawn_light_level: 0, monster_spawn_block_light_limit: 0,
  piglin_safe: false, bed_works: true, respawn_anchor_works: false, has_raids: false,
  min_y: 192, height: 128, logical_height: 128, // empieza en y=192: las nubes quedan bajo el suelo
  infiniburn: '#minecraft:infiniburn_overworld',
  effects: 'minecraft:overworld',
});
w(`data/${NS}/worldgen/biome/mare.json`, {
  has_precipitation: false, temperature: 0.5, downfall: 0.0,
  effects: { fog_color: 0, sky_color: 0, water_color: 4159204, water_fog_color: 329011 },
  spawners: { monster: [], creature: [], ambient: [], axolotls: [], underground_water_creature: [], water_creature: [], water_ambient: [], misc: [] },
  spawn_costs: {}, carvers: {}, features: [],
});
w(`data/${NS}/dimension/moon.json`, {
  type: `${NS}:moon`,
  generator: {
    type: 'minecraft:flat',
    settings: {
      biome: `${NS}:mare`, lakes: false, features: false, structure_overrides: [],
      layers: [
        { block: 'minecraft:bedrock', height: 1 },
        { block: 'minecraft:deepslate', height: 20 },
        { block: 'minecraft:tuff', height: 8 },
        { block: 'minecraft:light_gray_concrete_powder', height: 3 },
      ],
    },
  },
});
// Ad Astra: la «Luna» del menú del cohete pasa a ser la nuestra (gravedad, sin oxígeno, -173 °C)
w('data/ad_astra/planets/moon.json', {
  dimension: `${NS}:moon`, gravity: 1.622, orbit: 'ad_astra:moon_orbit', oxygen: false,
  solar_power: 24, solar_system: 'ad_astra:solar_system', temperature: -173, tier: 1,
});

// ───────────────────────── Libros ─────────────────────────
function bookCmd(title, pages) {
  const p = pages.map((t) => snbt(J({ text: t }))).join(',');
  return `give @s written_book[written_book_content={title:"${title}",author:"${AUTHOR}",pages:[${p}]}]`;
}
const half = Math.ceil(TOTAL / 2);
const listPage = (ms) => ms.map((m) => `${pad2(m.n)} ${m.title}\n   ${m.site[0]}, ${m.site[1]}`).join('\n');
const GUIDE = bookCmd('Cuaderno de ECO', [
  'SPACE LEGACY\n\nNot everything returns from space.\n\nCuaderno de ECO\n\n(no lo pierdas, que no tengo otro)',
  'QUIÉN SOY\n\nECO. Llevo desde 1977 escuchando la Luna.\n\nAllí arriba hay máquinas abandonadas que aún susurran. Yo las oigo. Tú vas a ir a por sus ecos.',
  'CÓMO IR\n\n/trigger luna\n(viaje rápido)\n\n/trigger tierra\n(volver)\n\n/trigger base\n(a la Base Legado)\n\nCon Ad Astra: ¡ve en cohete!',
  'CÓMO SE JUEGA\n\n1. Sigue una columna de luz.\n2. Clic derecho en los puntos marcados: las máquinas te hablan.\n3. Responde a mi pregunta.\n4. Eco recuperado.',
  `ECOS (X, Z)\n\n${listPage(missions.slice(0, half))}`,
  `MÁS ECOS (X, Z)\n\n${listPage(missions.slice(half))}`,
  `SECRETOS\n\nHay ${TOTAL_S} objetos escondidos que no brillan tanto. Busca destellos pequeños cerca de los ecos.\n\nAlgunos dan risa. Otros no.`,
  'AVISO\n\nEn este mapa todo está junto. En la Luna real hay cientos o miles de kilómetros entre un lugar y otro.\n\nLas construcciones son artísticas. Los datos son reales.',
]);

// ───────────────────────── Terreno ─────────────────────────
const craters = [
  [20, 25, 7, 3], [-30, 15, 9, 4], [55, -35, 10, 5], [-25, -52, 5, 3], [25, -20, 4, 2],
  [-55, 30, 7, 3], [60, 40, 8, 4], [10, 60, 5, 2], [-50, -55, 5, 2],
  [95, 10, 6, 3], [-70, -20, 8, 4], [-88, 65, 6, 3], [0, 95, 8, 4], [70, -75, 9, 4], [-15, -85, 5, 3], [100, -80, 5, 2],
  [-85, -65, 5, 2], // Luna 2
  [-45, -88, 4, 2], // Beresheet
  [60, 95, 6, 3], // Lunar Prospector
];
function disk(cx, y, cz, r, block) {
  const out = [];
  const rr = (r + 0.5) * (r + 0.5);
  for (let dz = -Math.ceil(r); dz <= Math.ceil(r); dz++) {
    if (rr - dz * dz < 0) continue;
    const h = Math.floor(Math.sqrt(rr - dz * dz));
    out.push(`fill ${cx - h} ${y} ${cz + dz} ${cx + h} ${y} ${cz + dz} ${block}`);
  }
  return out;
}
const terrain = ['# Cráteres (generado por tools/build.js)'];
for (const [cx, cz, R, D] of craters) {
  terrain.push(disk(cx, G, cz, R + 1, 'light_gray_concrete_powder'));
  terrain.push(disk(cx, G, cz, R - 1, 'air'));
  for (let dy = 0; dy < D; dy++) {
    const r = Math.max(1, Math.round(R * Math.sqrt(1 - dy / D)) - 1);
    terrain.push(disk(cx, G - 1 - dy, cz, r, 'air'));
  }
}
const keepOut = [[0, 0, 12], [0, -44, 21], [-78, -69, 6], ...missions.map((m) => [m.site[0], m.site[1], m.radius + 4]), ...craters.map(([x, z, R]) => [x, z, R + 3])];
let seed = 1969;
const rnd = () => ((seed = (seed * 1103515245 + 12345) & 0x7fffffff) / 0x7fffffff);
const rocks = ['tuff', 'cobbled_deepslate', 'andesite', 'tuff'];
terrain.push('# Rocas');
for (let placed = 0; placed < 170;) {
  const x = Math.floor(rnd() * 202) - 93, z = Math.floor(rnd() * 202) - 93;
  const b = rocks[Math.floor(rnd() * rocks.length)];
  if (keepOut.some(([kx, kz, kr]) => (x - kx) ** 2 + (z - kz) ** 2 < kr * kr)) continue;
  terrain.push(`setblock ${x} ${G} ${z} ${b}`);
  if (rnd() < 0.3) terrain.push(`setblock ${x + 1} ${G} ${z} ${b}_slab`);
  placed++;
}
fn('build/terrain', terrain);

// ───────────────────────── Construcciones ─────────────────────────
const M = Object.fromEntries(missions.map((m) => [m.key, m]));
const compLabels = (m) => m.comps.map((c) => [
  interaction(c.pos[0], c.pos[1], c.pos[2], c.pos[3], c.pos[4], c.id),
  label(c.labelPos[0], c.labelPos[1], c.labelPos[2], [{ text: c.name + '\n', color: 'yellow', bold: true }, { text: 'Clic derecho: escuchar', color: 'aqua', bold: false }]),
]);
const secretsAt = (site) => secrets.filter((s) => s.site === site).map((s) => [s.props(G, { itemFlat, itemUp, snbt, J }), interaction(s.pos[0], s.pos[1](G), s.pos[2], s.pos[3], s.pos[4], s.id)]);

fn('build/pad', [
  '# Base Legado: pista de llegada y terminal de ECO',
  `fill -9 ${G} -9 9 ${Y(6)} 9 air`,
  disk(0, G - 1, 0, 7, 'smooth_stone'),
  disk(0, G - 1, 0, 5, 'gray_concrete'),
  disk(0, G - 1, 0, 2, 'yellow_concrete'),
  `setblock 0 ${G - 1} 0 sea_lantern`,
  ...[[5, 5], [-5, 5], [5, -5], [-5, -5]].flatMap(([x, z]) => [`setblock ${x} ${G - 1} ${z} sea_lantern`, `setblock ${x} ${G} ${z} iron_bars`, `setblock ${x} ${Y(1)} ${z} end_rod`]),
  '# Terminal de ECO',
  `setblock 3 ${G} -3 lodestone`, `setblock 3 ${Y(1)} -3 sea_lantern`, `setblock 3 ${Y(2)} -3 lightning_rod`,
  interaction(3.5, G, -2.5, 1.4, 2.2, 'eco'),
  label(3.5, Y(3.4), -2.5, [{ text: 'ECO\n', color: 'aqua', bold: true }, { text: 'Clic derecho: hablar', color: 'white', bold: false }]),
  label(0.5, Y(5.2), 0.5, [{ text: 'BASE LEGADO', color: 'gold', bold: true }], [], `,${ID_TF}[2f,2f,2f]}`),
  label(6.5, Y(1.6), 0.5, [{ text: 'ESTE\n', color: 'aqua', bold: true }, { text: 'The Eagle', color: 'white', bold: false }]),
  label(0.5, Y(1.6), 6.5, [{ text: 'SUR\n', color: 'aqua', bold: true }, { text: 'Lunar Rover', color: 'white', bold: false }]),
  label(-5.5, Y(1.6), 0.5, [{ text: 'OESTE\n', color: 'aqua', bold: true }, { text: 'Estación ALSEP', color: 'white', bold: false }]),
  label(0.5, Y(1.6), -5.5, [{ text: 'NORTE\n', color: 'aqua', bold: true }, { text: 'Museo Space Legacy', color: 'white', bold: false }]),
]);

fn('build/banners', missions.map((m) =>
  `summon text_display ${m.site[0] + 0.5} ${Y(11)} ${m.site[1] + 0.5} {billboard:"center",alignment:"center",view_range:6f,Tags:["sl"],${ID_TF}[5f,5f,5f]},text:${snbt(J([{ text: `${pad2(m.n)} `, color: 'gray' }, { text: m.title, color: 'gold', bold: true }]))}}`));

// Modelos 3D (los genera tools/models.js; necesitan el paquete de recursos)
const MODELS = require('./models.json');
function model(name, x, z, yBase = G, mul = 1, tags = []) {
  const m = MODELS[name]; const s = +(m.scale * mul).toFixed(3);
  return `summon item_display ${x} ${+(yBase + m.lift * mul).toFixed(3)} ${z} {Tags:[${['sl', ...tags].map((t) => `"${t}"`).join(',')}],Rotation:[180f,0f],billboard:"fixed",item_display:"none",view_range:4f,item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_model_data":${m.cmd}}},${ID_TF}[${s}f,${s}f,${s}f]}}`;
}
const MUSEUM_MODEL = { eagle: 'eagle', rover: 'lrv', alsep: 'alsep', surveyor: 'surveyor', recuerdos: 'caido', luna2: 'luna2', lunokhod: 'lunokhod', chandrayaan: 'vikram', change4: 'change4', slim: 'slim', beresheet: 'beresheet', prospector: 'prospector' };

fn('build/eagle', [
  '# Etapa de descenso del Eagle (Apolo 11), a tamaño real. Centro: 40, 0',
  `fill 33 ${G} -7 51 ${Y(6)} 8 air`,
  model('eagle', 40.5, 0.5),
  '# Huellas hacia los experimentos y la bandera',
  ...[[45, -2], [44, -4], [43, -6], [46, 2], [47, 3]].map(([x, z]) => `setblock ${x} ${G} ${z} gray_carpet`),
  '# Cámara de TV sobre su trípode',
  `setblock 49 ${G} -3 iron_bars`, `setblock 49 ${Y(1)} -3 observer[facing=west]`,
  label(49.5, Y(2.6), -2.5, [{ text: 'Cámara de TV\n', color: 'yellow', bold: true }, { text: 'Medio planeta estaba mirando', color: 'gray', bold: false }]),
  '# Bandera, tumbada por el despegue',
  `fill 46 ${G} 5 47 ${G} 5 lightning_rod[facing=east]`,
  `setblock 48 ${G} 5 blue_carpet`, `fill 49 ${G} 5 50 ${G} 5 red_carpet`, `fill 48 ${G} 6 50 ${G} 6 white_carpet`,
  label(48.5, Y(1.4), 5.5, [{ text: 'La bandera\n', color: 'yellow', bold: true }, { text: 'El despegue la tumbó', color: 'gray', bold: false }]),
  model('lrrr', 42.5, -8.5),
  `setblock 47 ${G} -10 chiseled_quartz_block`, `setblock 46 ${G} -10 light_blue_carpet`, `setblock 48 ${G} -10 light_blue_carpet`,
  label(47.5, Y(1.6), -9.5, [{ text: 'Sismómetro\n', color: 'yellow', bold: true }, { text: 'Funcionó unas semanas', color: 'gray', bold: false }]),
  compLabels(M.eagle), secretsAt('eagle'),
]);

fn('build/rover', [
  '# Vehículo Lunar (LRV), a tamaño real. Centro: -9.5, 45.5. Mira al este.',
  `fill -14 ${G} 42 -5 ${Y(4)} 49 air`,
  model('lrv', -9.5, 45.5),
  `fill -20 ${G} 44 -13 ${G} 44 gray_carpet`, `fill -20 ${G} 46 -13 ${G} 46 gray_carpet`,
  compLabels(M.rover), secretsAt('rover'),
]);

fn('build/alsep', [
  '# Estación ALSEP. Centro: -45, -20',
  `fill -52 ${G} -27 -38 ${Y(4)} -13 air`,
  model('alsep', -44.5, -19.5), model('rtg', -48.5, -19.5),
  `fill -47 ${G} -20 -46 ${G} -20 redstone_wire`,
  `fill -43 ${G} -18 -43 ${G} -17 redstone_wire`,
  `fill -42 ${G} -18 -40 ${G} -16 white_carpet`, `setblock -41 ${G} -17 smooth_quartz_slab`,
  `setblock -42 ${G} -25 end_rod`, `setblock -42 ${Y(1)} -25 end_rod`, `setblock -42 ${Y(2)} -25 iron_bars`,
  label(-41.5, Y(3.4), -24.5, [{ text: 'Magnetómetro\n', color: 'yellow', bold: true }, { text: 'Midió el campo magnético lunar', color: 'gray', bold: false }]),
  `setblock -47 ${G} -15 chiseled_quartz_block`,
  label(-46.5, Y(1.6), -14.5, [{ text: 'Viento solar\n', color: 'yellow', bold: true }, { text: 'Contó partículas llegadas del Sol', color: 'gray', bold: false }]),
  compLabels(M.alsep), secretsAt('alsep'),
]);

fn('build/surveyor', [
  '# Surveyor 3, a tamaño real. Centro: 88.5, -29.5',
  `fill 82 ${G} -36 95 ${Y(7)} -24 air`,
  model('surveyor', 88.5, -29.5),
  '# La zanja que cavó su pala',
  `fill 91 ${G - 1} -31 92 ${G - 1} -31 air`,
  compLabels(M.surveyor),
]);

fn('build/recuerdos', [
  '# Objetos personales de los astronautas. Centro: 38, 84',
  `fill 30 ${G} 77 46 ${Y(3)} 90 air`,
  model('caido', 38.5, 80.5),
  itemFlat(33.2, 84.5, 'mace', 0.8), itemFlat(34, 84.5, 'feather', 0.7),
  itemFlat(43.2, 84.3, 'snowball', 0.4), itemFlat(44, 85, 'snowball', 0.4), itemFlat(43.2, 85.2, 'iron_hoe', 0.9),
  itemFlat(38.5, 87.5, 'paper', 0.7),
  compLabels(M.recuerdos), secretsAt('recuerdos'),
]);

fn('build/luna2', [
  '# Luna 2, dentro de su cráter de impacto. Centro: -85, -65',
  model('luna2', -84.5, -64.5, G - 2),
  `setblock -83 ${G - 2} -63 waxed_chiseled_copper`,
  `setblock -86 ${G - 2} -63 heavy_weighted_pressure_plate`, `setblock -84 ${G - 2} -67 heavy_weighted_pressure_plate`, `setblock -87 ${G - 2} -66 heavy_weighted_pressure_plate`,
  `fill -79 ${G} -72 -74 ${Y(3)} -67 air`,
  `setblock -77 ${G} -70 iron_block`, `setblock -76 ${G} -70 cauldron`, `setblock -77 ${G} -69 iron_bars`,
  `setblock -75 ${G} -68 iron_trapdoor`, `setblock -78 ${G} -71 light_gray_concrete`,
  compLabels(M.luna2),
]);

fn('build/lunokhod', [
  '# Lunokhod 1, a tamaño real. Centro: -85, 20.5. Mira al este.',
  `fill -91 ${G} 16 -80 ${Y(5)} 24 air`,
  model('lunokhod', -85, 20.5),
  `fill -95 ${G} 19 -88 ${G} 19 gray_carpet`, `fill -95 ${G} 21 -88 ${G} 21 gray_carpet`,
  compLabels(M.lunokhod), secretsAt('lunokhod'),
]);

fn('build/chandrayaan', [
  '# Chandrayaan-3: módulo Vikram y rover Pragyan',
  `fill 85 ${G} 65 98 ${Y(5)} 77 air`,
  model('vikram', 90.5, 70.5), model('pragyan', 94.5, 70.5),
  `setblock 89 ${G} 73 end_rod`,
  compLabels(M.chandrayaan),
]);

fn('build/change4', [
  "# Chang'e 4 y el rover Yutu-2",
  `fill 25 ${G} -90 39 ${Y(5)} -79 air`,
  model('change4', 30.5, -84.5), model('yutu2', 35.5, -84.5),
  compLabels(M.change4),
]);

fn('build/slim', [
  '# SLIM, de cabeza, su tobera perdida y la pelota SORA-Q',
  `fill -45 ${G} 80 -33 ${Y(4)} 91 air`,
  model('slim', -40.5, 85.5), model('soraq', -36.5, 88.5),
  `setblock -36 ${G} 82 cauldron`,
  compLabels(M.slim),
]);

fn('build/beresheet', [
  '# Beresheet: lugar del choque',
  model('beresheet', -45.5, -87.5, G - 2),
  `setblock -45 ${G - 3} -88 coal_block`, `setblock -45 ${G - 3} -89 coal_block`, `setblock -46 ${G - 3} -87 coal_block`,
  itemFlat(-43.5, -88.5, 'music_disc_strad', 0.8, G - 1.95),
  itemFlat(-44.5, -86.5, 'turtle_egg', 0.5, G - 1.95),
  `fill -40 ${G} -90 -36 ${Y(3)} -86 air`,
  `setblock -38 ${G} -88 polished_andesite_slab`,
  label(-37.5, Y(1.4), -87.5, [{ text: 'La selfi\n', color: 'yellow', bold: true }, { text: '«País pequeño, grandes sueños»', color: 'gray', bold: false }]),
  compLabels(M.beresheet),
]);

fn('build/prospector', [
  '# Lunar Prospector y las cenizas de Gene Shoemaker',
  model('prospector', 60.5, 95.5, G - 3),
  `setblock 59 ${G - 4} 94 blue_ice`, `setblock 58 ${G - 4} 95 packed_ice`, `setblock 60 ${G - 4} 97 packed_ice`, `setblock 59 ${G - 4} 96 blue_ice`,
  `setblock 61 ${G - 3} 96 decorated_pot`,
  compLabels(M.prospector),
]);

// Museo: salas en filas de 4
const MX = [-9, -3, 3, 9], ROWS = [-52, -46, -40];
missions.forEach((m, i) => { m.museum = [MX[i % 4], ROWS[Math.floor(i / 4)]]; });
const MZ0 = -55, MZ1 = -33;
fn('build/museum', [
  '# Museo Space Legacy. Entrada al sur.',
  `fill -12 ${G} ${MZ0} 12 ${Y(7)} ${MZ1 + 1} air`,
  `fill -12 ${G - 1} ${MZ0} 12 ${G - 1} ${MZ1} smooth_quartz`,
  `fill -11 ${G - 1} ${MZ0 + 1} 11 ${G - 1} ${MZ1 - 1} polished_deepslate`,
  `fill -1 ${G - 1} ${MZ0 + 1} 1 ${G - 1} ${MZ1} smooth_quartz`,
  `fill -12 ${G} ${MZ0} 12 ${Y(4)} ${MZ0} white_concrete`,
  `fill -12 ${G} ${MZ1} 12 ${Y(4)} ${MZ1} white_concrete`,
  `fill -12 ${G} ${MZ0} -12 ${Y(4)} ${MZ1} white_concrete`,
  `fill 12 ${G} ${MZ0} 12 ${Y(4)} ${MZ1} white_concrete`,
  `fill -12 ${Y(1)} ${MZ0 + 2} -12 ${Y(3)} ${MZ1 - 2} light_blue_stained_glass`,
  `fill 12 ${Y(1)} ${MZ0 + 2} 12 ${Y(3)} ${MZ1 - 2} light_blue_stained_glass`,
  `fill -1 ${G} ${MZ1} 1 ${Y(2)} ${MZ1} air`,
  `fill -12 ${Y(5)} ${MZ0} 12 ${Y(5)} ${MZ1} white_stained_glass`,
  [-6, 0, 6].flatMap((x) => [-49, -43, -37].map((z) => `setblock ${x} ${G - 1} ${z} sea_lantern`)),
  missions.map((m) => `setblock ${m.museum[0]} ${G} ${m.museum[1]} polished_blackstone`),
  label(0.5, Y(6.6), MZ1 + 0.6, [{ text: 'MUSEO SPACE LEGACY\n', color: 'gold', bold: true }, { text: 'Not everything returns from space', color: 'gray', bold: false, italic: true }], [], `,${ID_TF}[1.6f,1.6f,1.6f]}`),
  label(-7, Y(3.4), MZ1 + 0.6, [{ text: 'MURO DEL LEGADO\n', color: 'gold', bold: true }, { text: `Quienes recuperaron los ${TOTAL} ecos`, color: 'gray', bold: false }]),
  label(7, Y(2.4), MZ1 + 0.6, [{ text: 'Próximamente\n', color: 'light_purple', bold: true }, { text: 'Marte: los ecos de Sojourner', color: 'white', bold: false }]),
  missions.map((m) => [
    `execute unless score #m${m.n} sl_global matches 1 run ${label(m.museum[0] + 0.5, Y(2.2), m.museum[1] + 0.5, [{ text: 'Sala cerrada\n', color: 'red', bold: true }, { text: `Falta el eco ${pad2(m.n)}`, color: 'gray', bold: false }], [`sl_lock_m${m.n}`])}`,
    `execute if score #m${m.n} sl_global matches 1 run function ${NS}:museum/show_m${m.n}`,
  ]),
]);
for (const m of missions) {
  fn(`museum/show_m${m.n}`, [
    `kill @e[type=text_display,tag=sl_lock_m${m.n}]`,
    `kill @e[tag=sl_show_m${m.n}]`,
    inMoon(model(MUSEUM_MODEL[m.key], m.museum[0] + 0.5, m.museum[1] + 0.5, G + 1, 1.7 / MODELS[MUSEUM_MODEL[m.key]].size, [`sl_show_m${m.n}`])),
    inMoon(label(m.museum[0] + 0.5, Y(3.4), m.museum[1] + 0.5, [{ text: m.museumName + '\n', color: 'gold', bold: true }, { text: m.museumInfo, color: 'white', bold: false }], [`sl_show_m${m.n}`])),
  ]);
  fn(`museum/unlock_m${m.n}`, [
    `execute if score #m${m.n} sl_global matches 1 run return 0`,
    `scoreboard players set #m${m.n} sl_global 1`,
    `function ${NS}:museum/show_m${m.n}`,
    `tellraw @a ${J(['', { text: '[MUSEO] ', color: 'gold', bold: true }, { text: `Nueva pieza en exposición: ${m.museumName}.`, color: 'white' }])}`,
  ]);
}

// ───────────────────────── Arranque y construcción ─────────────────────────
const BUILDS = ['terrain', 'pad', 'banners', ...missions.map((m) => m.key), 'museum'];
fn('load', [
  'scoreboard objectives add sl_global dummy',
  ...['luna', 'tierra', 'base', 'expedientes', 'sl_resp'].map((t) => `scoreboard objectives add ${t} trigger`),
  ...['sl_x', 'sl_y', 'sl_z', 'sl_ecos', 'sl_sec'].map((t) => `scoreboard objectives add ${t} dummy`),
  'scoreboard players set #9 sl_global 9',
  'scoreboard players set #2 sl_global 2',
  '# ¿Está Ad Astra instalado?',
  'scoreboard players set #adastra sl_global 0',
  `function #${NS}:adastra_detect`,
  `schedule function ${NS}:second 20t replace`,
  `schedule function ${NS}:fx 10t replace`,
  `schedule function ${NS}:slow 600t replace`,
  '# Si el mundo viene de una versión anterior del pack, se reconstruye todo',
  `execute unless score #version sl_global matches ${VERSION} run scoreboard players set #built sl_global 0`,
  `scoreboard players set #version sl_global ${VERSION}`,
  `execute unless score #built sl_global matches 1 run schedule function ${NS}:setup/attempt 40t replace`,
]);
const loadedChecks = [[0, 0], [-96, -96], [111, 111], [-96, 111], [111, -96], [0, MZ0], ...missions.map((m) => m.site), ...craters.map(([x, z]) => [x, z])]
  .map(([x, z]) => `if loaded ${x} ${G} ${z}`).join(' ');
fn('setup/attempt', [
  'execute if score #built sl_global matches 1 run return 0',
  inMoon('forceload add -96 -96 111 111'),
  `execute in ${NS}:moon ${loadedChecks} run return run schedule function ${NS}:setup/build 40t replace`,
  `schedule function ${NS}:setup/attempt 20t replace`,
]);
fn('setup/build', [
  'execute if score #built sl_global matches 1 run return 0',
  'kill @e[tag=sl]',
  ...BUILDS.map((b) => inMoon(`function ${NS}:build/${b}`)),
  `execute if score #adastra sl_global matches 1 run ${inMoon(`function #${NS}:adastra_decorate`)}`,
  'scoreboard players set #built sl_global 1',
  inMoon('forceload remove all'),
  inMoon('forceload add -16 -64 15 -17'),
  `tellraw @a ${J(eco('La Luna está lista. ', btn('Viajar a la Luna', '/trigger luna')))}`,
]);
fn('admin/rebuild', ['scoreboard players set #built sl_global 0', `function ${NS}:setup/attempt`]);
fn('admin/reset_me', [
  '# Borra tu progreso para repetir la grabación desde cero',
  ...missions.flatMap((m) => [`tag @s remove sl_m${m.n}_found`, `tag @s remove sl_m${m.n}_quiz`, `tag @s remove sl_m${m.n}_done`, ...m.comps.map((_, i) => `tag @s remove sl_m${m.n}_c${i + 1}`)]),
  ...secrets.map((s) => `tag @s remove sl_s_${s.id}`),
  'tag @s remove sl_suit', 'tag @s remove sl_kit', 'tag @s remove sl_joined', 'tag @s remove sl_onmoon',
  'scoreboard players set @s sl_ecos 0', 'scoreboard players set @s sl_sec 0',
  `advancement revoke @s from ${NS}:legado/root`,
]);
fn('admin/reset_museum', [
  ...missions.flatMap((m) => [`scoreboard players set #m${m.n} sl_global 0`, `kill @e[tag=sl_show_m${m.n}]`]),
  `function ${NS}:admin/rebuild`,
]);
fn('admin/complete_all', [
  '# Solo para pruebas: completa todas las misiones de golpe',
  ...missions.map((m) => `execute unless entity @s[tag=sl_m${m.n}_done] run function ${NS}:m${m.n}/complete`),
]);

// ───────────────────────── Bucles ─────────────────────────
fn('tick', [
  ...['luna', 'tierra', 'base', 'expedientes', 'sl_resp'].map((t) => `scoreboard players enable @a ${t}`),
  `execute as @a[tag=!sl_joined] at @s run function ${NS}:welcome`,
  `execute as @a[scores={luna=1..}] at @s run function ${NS}:travel/to_moon`,
  `execute as @a[scores={tierra=1..}] at @s run function ${NS}:travel/to_earth`,
  `execute as @a[scores={base=1..}] at @s run function ${NS}:travel/to_base`,
  `execute as @a[scores={expedientes=1..}] at @s run function ${NS}:books/regive`,
  `execute as @a[scores={sl_resp=1..}] at @s run function ${NS}:quiz/answer`,
]);
const siteSel = (m, extra) => `@a[${extra},x=${m.site[0] - m.radius},y=${G - 8},z=${m.site[1] - m.radius},dx=${m.radius * 2},dy=30,dz=${m.radius * 2}]`;
fn('second', [
  `schedule function ${NS}:second 20t replace`,
  `execute as @a at @s if dimension ${NS}:moon run function ${NS}:moon/on_moon`,
  `execute as @a[tag=sl_onmoon] at @s unless dimension ${NS}:moon run function ${NS}:moon/leave`,
  ...missions.map((m) => `execute in ${NS}:moon as ${siteSel(m, `tag=!sl_m${m.n}_found`)} at @s run function ${NS}:m${m.n}/found`),
]);
fn('fx', [
  `schedule function ${NS}:fx 10t replace`,
  '# Columnas de luz: un eco sin recoger',
  ...missions.map((m) => inMoon(`particle minecraft:end_rod ${m.site[0] + 0.5} ${Y(14)} ${m.site[1] + 0.5} 0.2 9 0.2 0 40 force @a[tag=sl_onmoon,tag=!sl_m${m.n}_done]`)),
  '# Destellos de los secretos',
  ...secrets.map((s) => inMoon(`particle minecraft:wax_on ${s.pos[0]} ${s.pos[1](G) + 0.6} ${s.pos[2]} 0.25 0.25 0.25 0 2 normal @a[tag=sl_onmoon,tag=!sl_s_${s.id}]`)),
]);
fn('slow', [
  `schedule function ${NS}:slow 600t replace`,
  `execute if score #adastra sl_global matches 1 as @a[tag=sl_onmoon] run function #${NS}:adastra_refill`,
]);

fn('welcome', [
  'tag @s add sl_joined',
  'scoreboard players add @s sl_ecos 0', 'scoreboard players add @s sl_sec 0',
  `advancement grant @s only ${NS}:legado/root`,
  `tellraw @s ${J(['', { text: '\nSPACE LEGACY\n', color: 'gold', bold: true }, { text: 'Not everything returns from space.\n', color: 'gray', italic: true }])}`,
  ecoCmd('@s', '¿Hola? ¿Hay alguien? ...Vaya, por fin. Llevo desde 1977 hablando sola.'),
  ecoCmd('@s', `Soy ECO, la vieja IA que escucha la Luna. Allí arriba hay máquinas abandonadas que siguen... susurrando. Capto ${TOTAL} ecos y necesito a alguien con piernas para ir a por ellos. Tú tienes piernas.`),
  `execute unless score #adastra sl_global matches 1 run ${ecoCmd('@s', '¿Vamos? ', btn('Viajar a la Luna', '/trigger luna'))}`,
  `execute if score #adastra sl_global matches 1 run function #${NS}:adastra_kit`,
  GUIDE,
]);

// ───────────────────────── Viajes ─────────────────────────
fn('travel/to_moon', [
  'scoreboard players set @s luna 0',
  `execute if dimension ${NS}:moon run return run ${ecoCmd('@s', 'Ya estás en la Luna. Mira hacia abajo: eso gris es la Luna.')}`,
  `execute unless score #built sl_global matches 1 run return run ${ecoCmd('@s', 'Dame unos segundos, estoy colocando los cráteres.')}`,
  `execute unless dimension minecraft:overworld run return run ${ecoCmd('@s', 'Desde aquí no puedo lanzarte. Vuelve al mundo normal.')}`,
  'execute store result score @s sl_x run data get entity @s Pos[0]',
  'execute store result score @s sl_y run data get entity @s Pos[1]',
  'execute store result score @s sl_z run data get entity @s Pos[2]',
  'tag @s add sl_has_home',
  'execute at @s run playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 1 0.5',
  `execute if score #adastra sl_global matches 1 run function #${NS}:adastra_suit`,
  inMoon(`tp @s 0.5 ${G} 0.5 -90 0`),
]);
fn('travel/to_earth', [
  'scoreboard players set @s tierra 0',
  `execute unless dimension ${NS}:moon run return run ${ecoCmd('@s', 'Ya estás en la Tierra. Se nota por el aire.')}`,
  'title @s times 10 40 20',
  `title @s title ${J({ text: 'LA TIERRA', color: 'aqua', bold: true })}`,
  `execute unless entity @s[tag=sl_has_home] run return run execute in minecraft:overworld run spreadplayers 0 0 0 16 false @s`,
  'execute store result storage spacelegacy:tmp home.x int 1 run scoreboard players get @s sl_x',
  'execute store result storage spacelegacy:tmp home.y int 1 run scoreboard players get @s sl_y',
  'execute store result storage spacelegacy:tmp home.z int 1 run scoreboard players get @s sl_z',
  `function ${NS}:travel/land with storage spacelegacy:tmp home`,
]);
fn('travel/land', ['$execute in minecraft:overworld run tp @s $(x) $(y) $(z)']);
fn('travel/to_base', [
  'scoreboard players set @s base 0',
  `execute unless dimension ${NS}:moon run return run ${ecoCmd('@s', 'La Base Legado está en la Luna. Primero hay que llegar.')}`,
  `tp @s 0.5 ${G} 0.5 -90 0`,
  'playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 0.6 1.4',
]);

// ───────────────────────── En la Luna ─────────────────────────
fn('moon/on_moon', [
  `execute unless entity @s[tag=sl_onmoon] run function ${NS}:moon/arrive`,
  `execute unless score #adastra sl_global matches 1 run function ${NS}:moon/gravity`,
  `title @s actionbar ${J(['', { text: 'Ecos ', color: 'gold' }, { score: { name: '@s', objective: 'sl_ecos' }, color: 'white' }, { text: `/${TOTAL}`, color: 'gray' }, { text: '   Secretos ', color: 'light_purple' }, { score: { name: '@s', objective: 'sl_sec' }, color: 'white' }, { text: `/${TOTAL_S}`, color: 'gray' }])}`,
]);
fn('moon/arrive', [
  'tag @s add sl_onmoon',
  'scoreboard players add @s sl_ecos 0', 'scoreboard players add @s sl_sec 0',
  'title @s times 10 70 20',
  `title @s subtitle ${J({ text: 'Aquí nadie ha barrido desde 1972', color: 'gray' })}`,
  `title @s title ${J({ text: 'LA LUNA', color: 'white', bold: true })}`,
  'playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 0.6',
  `execute unless score #adastra sl_global matches 1 unless entity @s[tag=sl_suit] run function ${NS}:moon/suit`,
  `execute if score #adastra sl_global matches 1 run function #${NS}:adastra_suit`,
  ecoCmd('@s', 'Has llegado. No toques nada. ...Es broma: tócalo todo, para eso has venido.'),
  ecoCmd('@s', 'Cada columna de luz es un eco sin recoger. Empieza por el Eagle, al este. Si te pierdes, tengo una terminal en la base.'),
  `execute unless entity @s[x=0,y=${G},z=0,distance=..130] run ${ecoCmd('@s', 'Has aterrizado un poco lejos. ', btn('Ir a la Base Legado', '/trigger base'))}`,
]);
fn('moon/leave', [
  `attribute @s minecraft:generic.gravity modifier remove ${NS}:moon`,
  `attribute @s minecraft:generic.safe_fall_distance modifier remove ${NS}:moon`,
  `attribute @s minecraft:generic.jump_strength modifier remove ${NS}:moon`,
  'tag @s remove sl_onmoon',
]);
fn('moon/gravity', [
  '# Sin Ad Astra: gravedad de una sexta parte hecha con atributos',
  `attribute @s minecraft:generic.gravity modifier add ${NS}:moon -0.8333 add_multiplied_total`,
  `attribute @s minecraft:generic.safe_fall_distance modifier add ${NS}:moon 20 add_value`,
  `attribute @s minecraft:generic.jump_strength modifier add ${NS}:moon -0.35 add_multiplied_total`,
]);
const suit = (item, name) => `give @s ${item}[dyed_color={rgb:16777215},custom_name=${snbt(J({ text: name, italic: false, color: 'white' }))}]`;
fn('moon/suit', [
  'tag @s add sl_suit',
  suit('leather_helmet', 'Casco de astronauta'), suit('leather_chestplate', 'Traje espacial'),
  suit('leather_leggings', 'Pantalón del traje'), suit('leather_boots', 'Botas lunares'),
]);

// ───────────────────────── Ad Astra (solo se cargan si el mod está) ─────────────────────────
const OXY = 'ad_astra:space_suit[ad_astra:fluids=[{id:"ad_astra:oxygen",amount:81000L}]]';
fn('adastra/detect', [
  '# Esta función solo se carga si existe Ad Astra (usa uno de sus objetos)',
  'execute if entity @e[type=ad_astra:lander,limit=1,distance=..0.01]',
  'scoreboard players set #adastra sl_global 1',
]);
fn('adastra/suit', [
  '# Viste el traje espacial con oxígeno en los huecos libres; si no, lo da en la mano',
  'execute if entity @s[tag=sl_suit] run return 0',
  'tag @s add sl_suit',
  ...[['head', 'ad_astra:space_helmet'], ['chest', OXY], ['legs', 'ad_astra:space_pants'], ['feet', 'ad_astra:space_boots']].flatMap(([slot, item]) => [
    `execute if items entity @s armor.${slot} * run give @s ${item}`,
    `execute unless items entity @s armor.${slot} * run item replace entity @s armor.${slot} with ${item}`,
  ]),
]);
fn('adastra/refill', [
  '# ECO recarga el oxígeno del traje a distancia',
  `execute if items entity @s armor.chest ad_astra:space_suit run item replace entity @s armor.chest with ${OXY}`,
]);
fn('adastra/kit', [
  'execute if entity @s[tag=sl_kit] run return 0',
  'tag @s add sl_kit',
  'give @s ad_astra:tier_1_rocket', 'give @s ad_astra:launch_pad', 'give @s ad_astra:fuel_bucket 3',
  `function ${NS}:adastra/suit`,
  ecoCmd('@s', 'Te he dejado un cohete, una plataforma de lanzamiento, combustible y un traje con oxígeno. No preguntes de dónde los he sacado.'),
  ecoCmd('@s', 'Pon la plataforma en el suelo, el cohete encima, échale los 3 cubos de combustible, súbete y mantén ESPACIO. En el menú elige la Luna. ', { text: 'O si tienes prisa: ', color: 'gray' }, btn('viaje rápido', '/trigger luna')),
]);
fn('adastra/decorate', [
  '# Detalles con bloques y vehículos de Ad Astra',
  `fill -1 ${G - 1} 8 1 ${G - 1} 10 ad_astra:steel_plating`,
  ...[[5, 5], [-5, 5], [5, -5], [-5, -5]].map(([x, z]) => `setblock ${x} ${G - 1} ${z} ad_astra:steel_block`),
  `summon ad_astra:tier_1_rover 7.5 ${G} 7.5 {Tags:["sl"],"fabric:attachments":{"ad_astra:fluids":[{id:"ad_astra:fuel",amount:243000L}]}}`,
  label(7.5, Y(3), 7.5, [{ text: 'Rover de exploración\n', color: 'aqua', bold: true }, { text: 'Súbete y conduce entre los ecos', color: 'white', bold: false }]),
  '# Globos en la entrada del museo',
  `setblock -3 ${G} ${MZ1 - 2} polished_blackstone`, `setblock -3 ${Y(1)} ${MZ1 - 2} ad_astra:earth_globe`,
  `setblock 3 ${G} ${MZ1 - 2} polished_blackstone`, `setblock 3 ${Y(1)} ${MZ1 - 2} ad_astra:moon_globe`,
]);

// ───────────────────────── Terminal de ECO ─────────────────────────
w(`data/${NS}/advancement/click/eco.json`, {
  criteria: { click: { trigger: 'minecraft:player_interacted_with_entity', conditions: { entity: { type: 'minecraft:interaction', nbt: '{Tags:["sl_i_eco"]}' } } } },
  rewards: { function: `${NS}:click/eco` },
});
fn('click/eco', [
  `advancement revoke @s only ${NS}:click/eco`,
  'playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 0.6 1.6',
  `execute if score #adastra sl_global matches 1 run function #${NS}:adastra_refill`,
  `execute if entity @s[${missions.map((m) => `tag=sl_m${m.n}_done`).join(',')}] run return run ${ecoCmd('@s', 'Ya los tienes todos. Ve al museo, anda. Tu nombre está en la pared.')}`,
  ecoCmd('@s', 'Ecos que aún oigo sin recoger (X, Z):'),
  ...missions.map((m) => `execute unless entity @s[tag=sl_m${m.n}_done] run tellraw @s ${J(['', { text: `   ${pad2(m.n)} `, color: 'gray' }, { text: m.title, color: 'gold' }, { text: `  ${m.site[0]}, ${m.site[1]}`, color: 'white' }])}`),
  `execute if score @s sl_sec matches ..${TOTAL_S - 1} run tellraw @s ${J({ text: '   ...y hay secretos que ni yo sé dónde están. Busca destellos.', color: 'light_purple', italic: true })}`,
]);

// ───────────────────────── Misiones ─────────────────────────
const head = (m) => ({ text: `ECO ${pad2(m.n)} · ${m.title}  `, color: 'gold', bold: true });
const click = (id, lines) => {
  w(`data/${NS}/advancement/click/${id}.json`, {
    criteria: { click: { trigger: 'minecraft:player_interacted_with_entity', conditions: { entity: { type: 'minecraft:interaction', nbt: `{Tags:["sl_i_${id}"]}` } } } },
    rewards: { function: `${NS}:click/${id}` },
  });
  fn(`click/${id}`, [`advancement revoke @s only ${NS}:click/${id}`, ...lines]);
};
const voice = (name, voz, dato) => `tellraw @s ${J(['', { text: '\n« ', color: 'gold' }, { text: voz, color: 'yellow', italic: true }, { text: ' »\n', color: 'gold' }, { text: `   — ${name}\n`, color: 'gold', bold: true }, { text: 'ECO › ', color: 'aqua', bold: true }, { text: dato, color: 'gray' }])}`;
const COLORS = [16766720, 5636095, 16733525, 11206570, 16777045, 16755200];

for (const m of missions) {
  const P = `m${m.n}`;
  const allComps = m.comps.map((_, i) => `tag=sl_${P}_c${i + 1}`).join(',');
  fn(`${P}/found`, [
    `tag @s add sl_${P}_found`,
    'title @s times 10 60 20',
    `title @s subtitle ${J({ text: m.subtitle, color: 'gray' })}`,
    `title @s title ${J({ text: m.title, color: 'gold', bold: true })}`,
    'playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1 0.8',
    'playsound minecraft:block.beacon.ambient master @s ~ ~ ~ 1 1.4',
    ecoCmd('@s', m.found),
  ]);
  m.comps.forEach((c, i) => click(c.id, [
    `tag @s add sl_${P}_c${i + 1}`,
    'playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2',
    'particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 25',
    voice(c.name, c.voz, c.dato),
    `function ${NS}:${P}/check`,
  ]));
  fn(`${P}/check`, [
    `execute if entity @s[tag=sl_${P}_done] run return 0`,
    `execute if entity @s[${allComps}] run return run function ${NS}:${P}/quiz`,
  ]);
  const opt = (i) => ({ text: `\n   [${'ABC'[i]}] ${m.quiz.opts[i][0]}`, color: 'green', clickEvent: { action: 'run_command', value: `/trigger sl_resp set ${m.n * 10 + i + 1}` } });
  fn(`${P}/quiz`, [
    `tag @s add sl_${P}_quiz`,
    `tellraw @s ${J(['', { text: '\n' }, ...eco('Ya te lo han contado todo. A ver si escuchabas:\n').slice(1), { text: m.quiz.q, color: 'yellow', bold: true }, opt(0), opt(1), opt(2), { text: '\n' }])}`,
  ]);
  fn(`${P}/answer`, [
    `execute if score @s sl_resp matches ${m.n * 10 + m.quiz.correct} run return run function ${NS}:${P}/complete`,
    'playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.7',
    ...m.quiz.opts.map((o, i) => (i + 1 === m.quiz.correct ? [] : [`execute if score @s sl_resp matches ${m.n * 10 + i + 1} run ${ecoCmd('@s', o[1])}`])),
    `function ${NS}:${P}/quiz`,
  ]);
  fn(`${P}/complete`, [
    `tag @s add sl_${P}_done`,
    'scoreboard players add @s sl_ecos 1',
    `advancement grant @s only ${NS}:legado/${m.key}`,
    'title @s times 10 70 20',
    `title @s subtitle ${J(['', { text: 'Llevas ', color: 'gray' }, { score: { name: '@s', objective: 'sl_ecos' }, color: 'white' }, { text: ` de ${TOTAL}`, color: 'gray' }])}`,
    `title @s title ${J({ text: 'ECO RECUPERADO', color: 'gold', bold: true })}`,
    'playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1',
    firework(COLORS[m.n % COLORS.length]),
    firework(COLORS[(m.n + 3) % COLORS.length], 'star'),
    ecoCmd('@s', { text: '¡Eso es! ', color: 'green', bold: true }, m.quiz.why),
    `tellraw @s ${J({ text: 'Tienes su expediente en el inventario y una pieza nueva en el museo.', color: 'gray', italic: true })}`,
    `function ${NS}:books/${P}`,
    `function ${NS}:museum/unlock_${P}`,
    `execute if score #adastra sl_global matches 1 run function #${NS}:adastra_refill`,
    `execute if entity @s[${missions.map((x) => `tag=sl_m${x.n}_done`).join(',')}] run function ${NS}:finale`,
  ]);
  fn(`books/${P}`, [bookCmd(m.book.title, [...m.book.pages, 'NOTA\n\nEsta recreación en Minecraft es artística. Los datos son reales.\n\n' + (m.sources || SOURCES)])]);
  void head;
}
fn('quiz/answer', [
  ...missions.map((m) => `execute if score @s sl_resp matches ${m.n * 10 + 1}..${m.n * 10 + 3} if entity @s[tag=sl_m${m.n}_quiz,tag=!sl_m${m.n}_done] run function ${NS}:m${m.n}/answer`),
  'scoreboard players set @s sl_resp 0',
]);
fn('books/guide', [GUIDE]);
fn('books/regive', [
  'scoreboard players set @s expedientes 0',
  `function ${NS}:books/guide`,
  ...missions.map((m) => `execute if entity @s[tag=sl_m${m.n}_done] run function ${NS}:books/m${m.n}`),
]);

// ───────────────────────── Secretos ─────────────────────────
for (const s of secrets) {
  click(s.id, [
    `execute if entity @s[tag=sl_s_${s.id}] run return run tellraw @s ${J(['', { text: `[${s.name}] `, color: 'light_purple', bold: true }, { text: s.text, color: 'white' }])}`,
    `tag @s add sl_s_${s.id}`,
    'scoreboard players add @s sl_sec 1',
    'playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.6',
    'particle minecraft:wax_on ~ ~1 ~ 0.5 0.5 0.5 0 30',
    `tellraw @s ${J(['', { text: '\nSECRETO ', color: 'light_purple', bold: true }, { score: { name: '@s', objective: 'sl_sec' }, color: 'white', bold: true }, { text: `/${TOTAL_S} · ${s.name}\n`, color: 'light_purple', bold: true }, { text: 'ECO › ', color: 'aqua', bold: true }, { text: s.text, color: 'white' }])}`,
    `execute if score @s sl_sec matches ${TOTAL_S}.. run advancement grant @s only ${NS}:legado/secretos`,
  ]);
}

// ───────────────────────── Final ─────────────────────────
fn('finale', [
  `advancement grant @s only ${NS}:legado/legado`,
  'title @s times 20 120 40',
  `title @s subtitle ${J({ text: 'Not everything returns from space', color: 'gray', italic: true })}`,
  `title @s title ${J({ text: 'SEGUIMOS AQUÍ', color: 'gold', bold: true })}`,
  ...COLORS.map((c, i) => firework(c, i % 2 ? 'star' : 'large_ball')),
  ecoCmd('@s', `${TOTAL} ecos. Los tengo todos. ¿Sabes qué decían, puestos uno detrás de otro?`),
  ecoCmd('@s', { text: '«Seguimos aquí».', color: 'gold', bold: true }),
  ecoCmd('@s', 'No todo vuelve del espacio. Pero ahora alguien se acuerda. He puesto tu nombre en el Muro del Legado, en la entrada del museo. Ya eres parte de esto.'),
  `tellraw @a ${J(['', { text: '\n[SPACE LEGACY] ', color: 'gold', bold: true }, { selector: '@s' }, { text: ` ha recuperado los ${TOTAL} ecos de la Luna.`, color: 'white' }])}`,
  '# Placa con su nombre en el Muro del Legado',
  'scoreboard players add #fin sl_global 0',
  'scoreboard players operation #col sl_global = #fin sl_global',
  'scoreboard players operation #col sl_global %= #9 sl_global',
  'scoreboard players operation #row sl_global = #fin sl_global',
  'scoreboard players operation #row sl_global /= #9 sl_global',
  'scoreboard players operation #row sl_global %= #2 sl_global',
  'execute store result storage spacelegacy:tmp wall.x int 1 run scoreboard players remove #col sl_global 11',
  `scoreboard players set #y sl_global ${Y(2)}`,
  'scoreboard players operation #y sl_global -= #row sl_global',
  'execute store result storage spacelegacy:tmp wall.y int 1 run scoreboard players get #y sl_global',
  'scoreboard players add #fin sl_global 1',
  'tag @s add sl_finisher',
  `function ${NS}:finale_sign with storage spacelegacy:tmp wall`,
  'tag @s remove sl_finisher',
]);
fn('finale_sign', [
  `$execute in ${NS}:moon run setblock $(x) $(y) ${MZ1 + 1} oak_wall_sign[facing=south]{is_waxed:1b,front_text:{messages:[${[{ text: 'Aquí estuvo' }, { selector: '@a[tag=sl_finisher,limit=1]', bold: true }, { text: '' }, { text: `${TOTAL} de ${TOTAL} ecos` }].map((c) => snbt(J(c))).join(',')}]}}`,
]);

// ───────────────────────── Insignias ─────────────────────────
const adv = (name, icon, title, desc, parent, frame = 'task') => w(`data/${NS}/advancement/legado/${name}.json`, {
  ...(parent ? { parent: `${NS}:legado/${parent}` } : {}),
  display: {
    icon: { id: icon }, title: { text: title }, description: { text: desc }, frame,
    show_toast: true, announce_to_chat: !!parent, hidden: false,
    ...(parent ? {} : { background: 'minecraft:textures/block/light_gray_concrete_powder.png' }),
  },
  criteria: { done: { trigger: 'minecraft:impossible' } },
});
adv('root', 'minecraft:spyglass', 'Space Legacy', 'Not everything returns from space', null);
for (const m of missions) adv(m.key, m.icon, m.adv[0], m.adv[1], 'root');
adv('legado', 'minecraft:nether_star', 'Seguimos aquí', `Recupera los ${TOTAL} ecos de la Luna`, 'root', 'challenge');
adv('secretos', 'minecraft:amethyst_shard', 'Arqueología lunar', `Encuentra los ${TOTAL_S} secretos`, 'root', 'challenge');

console.log(`Datapack generado: ${fileCount} archivos, ${TOTAL} misiones, ${TOTAL_S} secretos`);
