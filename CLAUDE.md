
# Kadhai Shorts — Design System

## Typography

**Font Family:** Roboto

| Style | Size | Weight | Weight Value | Use Case |
|-------|------|--------|--------------|----------|
| H1 | 24px | Bold | 700 | Page titles, hero headings |
| H2 | 20px | Semi Bold | 600 | Section headings, card titles |
| Body Text | 16px | Regular | 400 | Paragraphs, descriptions, labels |
| Small Text | 14px | Regular | 400 | Captions, metadata, hints |
| CTA Button | 15px | Medium | 500 | Button labels |
| Nav Label | 16px | Regular | 400 | Bottom nav bar tab labels |

**Line Height:** 100% (normal) | **Letter Spacing:** 0

---

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| Primary | `#CF2E4E` | Active nav icons, accents, inline text (≥16px on dark) |
| Primary Light | `#FF6B81` | Small text on dark backgrounds (≤14px) — passes AA 5.8:1 |
| Orange | `#F16623` | Brand gradient start |
| Red | `#E71F2C` | Brand gradient mid |
| Rose | `#991C4A` | Brand gradient end |
| Black | `#212121` | Primary text |
| Grey | `#5C5C5C` | Secondary text, inactive nav labels, secondary buttons |
| White | `#FFFFFF` | Text on dark backgrounds, light surfaces |
| Grey Stroke | `#929596` | Borders, dividers, stroke outlines |
| Dark BG | `#0F0F0F` | App background (dark theme), nav bar background |

### Brand Gradient (Source of Truth)

```css
background: linear-gradient(135deg, #F16623 0%, #E71F2C 30%, #991C4A 100%);
```

- **Direction:** 135deg (top-left → bottom-right)
- **Stops:** 0% `#F16623` → 30% `#E71F2C` → 100% `#991C4A`
- **Used for:** Primary button backgrounds, selected/active card states, highlighted CTAs

### Text on Dark Backgrounds (Accessibility)

| Text Size | Color to Use | Contrast Ratio | AA Status |
|-----------|-------------|----------------|-----------|
| ≥ 16px | `#CF2E4E` | 3.5:1 | Passes (large text) |
| ≤ 14px | `#FF6B81` | 5.8:1 | Passes AA |

> **Rule:** Never use `#CF2E4E` for small text (≤14px) on `#0F0F0F` — it fails AA contrast.

---

## Buttons

### Button Shape (Squircle)

No pill shapes. Ever. `border-radius: 9999px` is **banned**.

| Height | Border Radius | Usage |
|--------|--------------|-------|
| ≤ 46px | 10px | Standard buttons, dialog CTAs |
| ≥ 52px | 12px | Large CTAs, onboarding actions |

### Button Types

| Type | Background | Text Color | Border | Use Case |
|------|-----------|------------|--------|----------|
| Primary | `linear-gradient(135deg, #F16623 0%, #E71F2C 30%, #991C4A 100%)` | `#FFFFFF` | None | Main action (Subscribe, Watch, Continue) |
| Gold/Premium | `linear-gradient(90deg, #F9D684, #FBF1BF)` | `#673B21` | None | Premium/subscription CTAs |
| Stroke | Transparent | `#CF2E4E` | 1px `#CF2E4E` | Secondary actions |
| Disabled | `#5C5C5C` | `#FFFFFF` | None | Non-interactive state |

> **Important:** Solid `#CF2E4E` as a button background is **not allowed** — always use the brand gradient for primary buttons.

### Button Sizes

| Size | Width | Height | Padding (H × V) | Font Size | Radius |
|------|-------|--------|-----------------|-----------|--------|
| X-Small | 117px | 32px | — | 15px | 10px |
| Small | 131px | 36px | — | 15px | 10px |
| Medium | 157px | 46px | 24px × 12px | 15px / 19px | 10px |
| Large | 191px | 57px | — | 15px | 12px |

### CTA Button (In-Screen)

Used inline within screens (e.g. "Watch Trailer", "Reserve"):

- **Height:** 42px
- **Padding:** 24px × 12px
- **Border Radius:** 10px
- **Font:** Roboto Medium, 15px
- **Background (primary action):** Brand gradient
- **Background (secondary action):** `#5C5C5C`
- **Text Color:** `#FFFFFF`

### Dialog Buttons (Cancel / Confirm)

- **Height:** 35px
- **Border Radius:** 10px
- **Cancel:** Stroke style, `#5C5C5C` border, `#5C5C5C` text
- **Confirm/Logout:** Brand gradient background

### Code Review Checklist

- Radius not `10px` / `12px` → **reject**
- `border-radius: 9999px` → **reject**
- Wrong gradient (not 135deg with correct stops) → **reject**
- Solid `#CF2E4E` used as button background → **reject** (use gradient)
- Small red text (≤14px) using `#CF2E4E` on dark bg → **reject** (use `#FF6B81`)

---

## Icons

- **Style:** Line/Outlined (inactive) + Solid/Filled (active)
- **Size:** 24 × 24px
- **Active color:** `#CF2E4E`
- **Inactive color:** `#5C5C5C`

### Navigation Icons

| Icon | Outlined (inactive) | Solid (active) |
|------|---------------------|----------------|
| Home | Outlined house | Filled house |
| Explore | Outlined reels | Filled reels |
| My List | Outlined bookmark | Filled bookmark |
| Profile | Outlined person | Filled person |

---

## Navigation Bar

- **Background:** `#0F0F0F`
- **Height:** 69px
- **Width:** Full screen (480px base / fluid)
- **Padding:** 30px horizontal, 8px vertical
- **Icon size:** 24 × 24px
- **Icon-to-label gap:** 4px
- **Label font:** Roboto Regular, 16px
- **Active state:** Icon filled + label in `#CF2E4E`
- **Inactive state:** Icon outlined + label in `#5C5C5C`
- **Shadow:** `0px 1px 3px rgba(0, 0, 0, 0.25)` (bottom edge)

## Top Bar

- **Variants:** With Search Bar / Logo Only / Light Theme
- **Height:** 36px (inner content)
- **Logo alignment:** Left
- **Search bar:** Inline, center/right

---

## Spacing & Grid

| Token | Value | Usage |
|-------|-------|-------|
| xs | 4px | Icon-to-label gap, tight internal gaps |
| sm | 8px | Nav bar vertical padding |
| md | 12px | Button vertical padding |
| lg | 24px | Button horizontal padding, section gaps |
| xl | 30px | Nav bar horizontal padding |

### Layout

- **Base mobile width:** 480px
- **Horizontal screen padding:** 16–24px
- **Border radius — cards:** 10px
- **Border radius — standard buttons (≤46px):** 10px
- **Border radius — large CTA buttons (≥52px):** 12px
- **Border radius — inputs/containers:** 6px

---

## Shadows

| Token | Value | Usage |
|-------|-------|-------|
| Drop/Small | `0px 1px 3px rgba(0, 0, 0, 0.25)` | Nav bar, cards |

---

## Themes

| Theme | Background | Text Primary | Nav Background |
|-------|-----------|--------------|----------------|
| Dark (default) | `#0F0F0F` | `#FFFFFF` | `#0F0F0F` |
| Light | `#FFFFFF` | `#212121` | `#FFFFFF` |
