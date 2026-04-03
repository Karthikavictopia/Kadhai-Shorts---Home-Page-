$j = Get-Content 'C:\Claude Explore\Kadhaishorts\thumb_b64.json' -Encoding UTF8 | ConvertFrom-Json
$wifi    = $j.'wifi-woes-at-home'
$coastal = $j.'coastal-secrets'
$prank   = $j.'public-prank-party'
$rainy   = $j.'rainy-rendezvous'

$code = @"
const CARD_W = 150, CARD_H = 212, SCREEN_W = 390;

await Promise.all([
  figma.loadFontAsync({ family: 'Roboto', style: 'Bold' }),
  figma.loadFontAsync({ family: 'Roboto', style: 'Regular' }),
]);

const section = figma.getNodeById('570:1331');
if (!section) { figma.notify('Section 570:1331 not found'); return; }

function hexRGB(h) {
  return { r: parseInt(h.slice(1,3),16)/255, g: parseInt(h.slice(3,5),16)/255, b: parseInt(h.slice(5,7),16)/255 };
}
function solid(hex, opacity = 1) { return { type: 'SOLID', color: hexRGB(hex), opacity }; }

function b64ToU8(b64) {
  const bin = atob(b64), arr = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) arr[i] = bin.charCodeAt(i);
  return arr;
}

const BRAND = {
  type: 'GRADIENT_LINEAR',
  gradientTransform: [[1,-1,0],[1,1,0]],
  gradientStops: [
    { position: 0,    color: { ...hexRGB('#F16623'), a: 1 } },
    { position: 0.30, color: { ...hexRGB('#E71F2C'), a: 1 } },
    { position: 1,    color: { ...hexRGB('#991C4A'), a: 1 } },
  ]
};
const BOTTOM_FADE = {
  type: 'GRADIENT_LINEAR',
  gradientTransform: [[0,1,0.5],[-1,0,1]],
  gradientStops: [
    { position: 0,    color: { r: 0, g: 0, b: 0, a: 0.82 } },
    { position: 0.55, color: { r: 0, g: 0, b: 0, a: 0 } },
  ]
};

function hug(name, dir) {
  const f = figma.createFrame();
  f.name = name; f.layoutMode = dir; f.fills = [];
  f.primaryAxisSizingMode = 'AUTO'; f.counterAxisSizingMode = 'AUTO';
  f.paddingTop = f.paddingBottom = f.paddingLeft = f.paddingRight = 0;
  f.itemSpacing = 0; f.clipsContent = false;
  return f;
}

// Load thumbnail images
const thumbImages = [
  figma.createImage(b64ToU8('$wifi')),
  figma.createImage(b64ToU8('$coastal')),
  figma.createImage(b64ToU8('$prank')),
  figma.createImage(b64ToU8('$rainy')),
];

// MAIN frame
const main = hug('Trending Section', 'VERTICAL');
main.fills = [solid('#0F0F0F')];
main.paddingTop = 24;
main.paddingBottom = 16;
main.itemSpacing = 14;
main.counterAxisSizingMode = 'FIXED';
main.resize(SCREEN_W, main.height);

// HEADER
const header = hug('Section Header', 'HORIZONTAL');
header.paddingLeft = header.paddingRight = 20;
header.primaryAxisAlignItems = 'SPACE_BETWEEN';
header.counterAxisAlignItems = 'CENTER';

const iconRow = hug('Icon + Title', 'HORIZONTAL');
iconRow.itemSpacing = 7;
iconRow.counterAxisAlignItems = 'CENTER';

const fireIcon = figma.createRectangle();
fireIcon.name = 'Fire Icon'; fireIcon.resize(16,16);
fireIcon.cornerRadius = 3; fireIcon.fills = [BRAND];

const titleText = figma.createText();
titleText.fontName = { family: 'Roboto', style: 'Bold' };
titleText.fontSize = 17;
titleText.characters = 'Trending';
titleText.fills = [{ type: 'SOLID', color: { r:1,g:1,b:1 } }];

iconRow.appendChild(fireIcon);
iconRow.appendChild(titleText);
header.appendChild(iconRow);
main.appendChild(header);
header.layoutSizingHorizontal = 'FILL';

// CARDS ROW
const row = hug('Cards Row', 'HORIZONTAL');
row.paddingLeft = row.paddingRight = 20;
row.itemSpacing = 12;

const CARDS = [
  { rank:'1', label:'Wifi Woes at Home' },
  { rank:'2', label:'Coastal Secrets' },
  { rank:'3', label:'Public Prank Party' },
  { rank:'4', label:'Rainy Rendezvous' },
];

CARDS.forEach(({ rank, label }, i) => {
  const card = figma.createFrame();
  card.name = 'Card ' + rank + ' - ' + label;
  card.resize(CARD_W, CARD_H);
  card.cornerRadius = 10; card.clipsContent = true;
  card.layoutMode = 'NONE';
  card.fills = [solid('#1A1A1A')];

  const thumb = figma.createRectangle();
  thumb.name = 'Thumbnail'; thumb.resize(CARD_W, CARD_H);
  thumb.x = thumb.y = 0;
  thumb.fills = [{ type:'IMAGE', imageHash: thumbImages[i].hash, scaleMode:'FILL' }];

  const gradRect = figma.createRectangle();
  gradRect.name = 'Gradient Overlay'; gradRect.resize(CARD_W, CARD_H);
  gradRect.x = gradRect.y = 0; gradRect.fills = [BOTTOM_FADE];

  const badge = hug('Hot Badge', 'HORIZONTAL');
  badge.paddingLeft = badge.paddingRight = 7;
  badge.paddingTop = badge.paddingBottom = 3;
  badge.itemSpacing = 3;
  badge.counterAxisAlignItems = 'CENTER';
  badge.cornerRadius = 8; badge.fills = [BRAND];
  badge.x = 8; badge.y = 8;

  const hotTxt = figma.createText();
  hotTxt.fontName = { family: 'Roboto', style: 'Bold' };
  hotTxt.fontSize = 9; hotTxt.characters = 'Hot';
  hotTxt.fills = [{ type:'SOLID', color:{ r:1,g:1,b:1 } }];
  badge.appendChild(hotTxt);

  const rankTxt = figma.createText();
  rankTxt.name = 'Rank ' + rank;
  rankTxt.fontName = { family: 'Roboto', style: 'Bold' };
  rankTxt.fontSize = 64; rankTxt.characters = rank;
  rankTxt.fills   = [{ type:'SOLID', color:{ r:1,g:1,b:1 }, opacity: 0.18 }];
  rankTxt.strokes = [{ type:'SOLID', color:{ r:1,g:1,b:1 }, opacity: 0.85 }];
  rankTxt.strokeWeight = 2; rankTxt.strokeAlign = 'OUTSIDE';
  rankTxt.x = 6; rankTxt.y = CARD_H - 72;

  card.appendChild(thumb);
  card.appendChild(gradRect);
  card.appendChild(badge);
  card.appendChild(rankTxt);
  row.appendChild(card);
});

main.appendChild(row);
section.appendChild(main);
main.x = 0; main.y = 0;
figma.viewport.scrollAndZoomIntoView([main]);
figma.notify('Trending section pushed!');
"@

$code | Out-File 'C:\Claude Explore\Kadhaishorts\figma_code_out.js' -Encoding UTF8
Write-Host "Generated. Char count: $($code.Length)"
