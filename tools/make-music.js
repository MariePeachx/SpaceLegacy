// Música ambiental sencilla para el vídeo (30 s, generada por código): video/public/musica.wav
const fs = require('fs'), path = require('path');
const SR = 44100, DUR = 30, N = SR * DUR, L = new Float32Array(N), R = new Float32Array(N);
const pad = [55, 110, 164.81, 220, 246.94, 329.63]; // La menor con novena
for (let i = 0; i < N; i++) {
  const t = i / SR; let env = Math.min(1, t / 3) * Math.min(1, (DUR - t) / 2.5);
  const swell = t > 23.5 ? 1 + Math.min(1, (t - 23.5) / 2) * 0.5 : 1;
  let l = 0, r = 0;
  pad.forEach((f, k) => { const lfo = 0.6 + 0.4 * Math.sin(2 * Math.PI * (0.07 + k * 0.013) * t + k);
    const a = 0.085 * lfo / (1 + k * 0.25);
    l += a * Math.sin(2 * Math.PI * f * t + 0.3 * Math.sin(2 * Math.PI * 0.2 * t));
    r += a * Math.sin(2 * Math.PI * f * 1.003 * t + k); });
  L[i] = l * env * swell; R[i] = r * env * swell;
}
const ping = (t0, f, vol = 0.22, dec = 2.2) => { for (let i = Math.floor(t0 * SR); i < Math.min(N, (t0 + 3) * SR); i++) { const t = i / SR - t0; const v = vol * Math.exp(-t * dec) * (Math.sin(2 * Math.PI * f * t) + 0.35 * Math.sin(2 * Math.PI * f * 2 * t)); L[i] += v * 0.8; R[i] += v; } };
const boom = (t0) => { for (let i = Math.floor(t0 * SR); i < Math.min(N, (t0 + 2.5) * SR); i++) { const t = i / SR - t0; const v = 0.5 * Math.exp(-t * 2) * Math.sin(2 * Math.PI * (48 + 30 * Math.exp(-t * 9)) * t); L[i] += v; R[i] += v; } };
ping(0.6, 880, 0.12); boom(4); ping(4, 440, 0.2);
const scale = [440, 523.25, 659.25, 587.33, 783.99, 659.25, 880, 987.77];
for (let k = 0; k < 8; k++) ping(9 + k * 1.25, scale[k], 0.16, 3);
boom(19); ping(19, 329.63); ping(21, 440, 0.14); ping(23, 523.25, 0.14); boom(25); ping(25, 659.25, 0.22, 1.2); ping(25.2, 880, 0.16, 1.2);
const buf = Buffer.alloc(44 + N * 4); buf.write('RIFF', 0); buf.writeUInt32LE(36 + N * 4, 4); buf.write('WAVEfmt ', 8); buf.writeUInt32LE(16, 16); buf.writeUInt16LE(1, 20); buf.writeUInt16LE(2, 22); buf.writeUInt32LE(SR, 24); buf.writeUInt32LE(SR * 4, 28); buf.writeUInt16LE(4, 32); buf.writeUInt16LE(16, 34); buf.write('data', 36); buf.writeUInt32LE(N * 4, 40);
for (let i = 0; i < N; i++) { buf.writeInt16LE(Math.max(-1, Math.min(1, L[i])) * 32000, 44 + i * 4); buf.writeInt16LE(Math.max(-1, Math.min(1, R[i])) * 32000, 46 + i * 4); }
fs.writeFileSync(path.join(__dirname, '..', 'video', 'public', 'musica.wav'), buf); console.log('musica.wav lista');
