// Prepara un mundo generado por el servidor de pruebas para jugarlo en un jugador:
// le pone nombre, activa los trucos y le añade el paquete de recursos.
// uso: node tools/pack-world.js <carpeta del mundo del servidor>
const fs = require('fs'), path = require('path'), zlib = require('zlib');
const src = process.argv[2];
const ROOT = path.join(__dirname, '..');
const dst = path.join(ROOT, 'modpack', 'saves', 'Space Legacy');
fs.rmSync(dst, { recursive: true, force: true });
fs.cpSync(src, dst, { recursive: true });
for (const f of ['session.lock', 'level.dat_old']) fs.rmSync(path.join(dst, f), { force: true });

let nbt = zlib.gunzipSync(fs.readFileSync(path.join(dst, 'level.dat')));
const tagPos = (type, name) => nbt.indexOf(Buffer.concat([Buffer.from([type, 0, name.length]), Buffer.from(name)]));
// allowCommands (byte) = 1
let p = tagPos(1, 'allowCommands'); if (p < 0) throw new Error('sin allowCommands');
nbt[p + 3 + 'allowCommands'.length] = 1;
// GameType (int)
p = tagPos(3, 'GameType'); const gameType = nbt.readInt32BE(p + 3 + 'GameType'.length);
// LevelName (string)
p = tagPos(8, 'LevelName'); if (p < 0) throw new Error('sin LevelName');
const at = p + 3 + 'LevelName'.length, oldLen = nbt.readUInt16BE(at), name = Buffer.from('Space Legacy');
const len = Buffer.alloc(2); len.writeUInt16BE(name.length);
nbt = Buffer.concat([nbt.subarray(0, at), len, name, nbt.subarray(at + 2 + oldLen)]);
fs.writeFileSync(path.join(dst, 'level.dat'), zlib.gzipSync(nbt));

fs.copyFileSync(path.join(ROOT, 'SpaceLegacyRP.zip'), path.join(dst, 'resources.zip'));
console.log('Mundo listo:', dst, '| modo de juego:', gameType, '(1 = creativo) | trucos activados');
