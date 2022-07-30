import http from 'http';
import fs from 'fs/promises';
import path from 'path';

const host = '0.0.0.0';
const port = 8000;

function contentType(fsPath) {
  const extname = path.extname(fsPath);
  if (extname === '.html') return 'text/html';
  if (extname === '.js') return 'application/javascript';
  if (extname === '.wasm') return 'application/wasm';

  return 'text/plain';
}

async function serveFile(res, urlPath) {
  try {
    const fsPath = path.join('./out/browser/', urlPath);
    const contents = await fs.readFile(fsPath);
    res.setHeader('Content-Type', contentType(fsPath));
    res.writeHead(200);
    res.end(contents);
  } catch {
    res.writeHead(400);
    res.end('Not found');
  }
}

const requestListener = async function (req, res) {
  console.log(req.url);

  if (req.url === '/') {
    serveFile(res, '/index.html');
    return;
  }

  serveFile(res, req.url);
};

const server = http.createServer(requestListener);
server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});
