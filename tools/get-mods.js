// Descarga Ad Astra y sus dependencias (Fabric, 1.21.1) desde Modrinth y comprueba su hash
const fs = require('fs'), path = require('path'), crypto = require('crypto');
const slugs = ['ad-astra', 'resourceful-lib', 'resourceful-config', 'common-storage-lib', 'fabric-api'];
const out = path.join(__dirname, '..', 'mods');
(async () => {
  for (const slug of slugs) {
    const url = `https://api.modrinth.com/v2/project/${slug}/version?loaders=${encodeURIComponent('["fabric"]')}&game_versions=${encodeURIComponent('["1.21.1"]')}`;
    const vs = await (await fetch(url, { headers: { 'User-Agent': 'modpack-setup-script' } })).json();
    const v = vs.find((x) => x.version_type === 'release') || vs[0];
    const f = v.files.find((x) => x.primary) || v.files[0];
    const buf = Buffer.from(await (await fetch(f.url)).arrayBuffer());
    const ok = crypto.createHash('sha512').update(buf).digest('hex') === f.hashes.sha512;
    if (!ok) throw new Error('hash incorrecto: ' + f.filename);
    fs.writeFileSync(path.join(out, f.filename), buf);
    console.log(slug, v.version_number, f.filename, (buf.length / 1e6).toFixed(1) + ' MB', 'hash OK', 'deps:', v.dependencies.filter(d => d.dependency_type === 'required').map(d => d.project_id).join(','));
  }
})().catch((e) => { console.error(e); process.exit(1); });
