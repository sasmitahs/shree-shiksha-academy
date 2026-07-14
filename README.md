# Shree Shiksha Academy — Website

Marketing site for **Shree Shiksha Academy**, a coaching centre in Ramamurthy Nagar, Bengaluru (Class 1–12). Deploy to Netlify with a custom domain.

## Business details (from Google Maps)

| Field | Value |
|-------|--------|
| Name | Shree Shiksha Academy |
| Address | Chandra Enclave 3, Jayanti Nagar Main Rd, above Shree Cycles, Ramamurthy Nagar, Bengaluru 560016 |
| Phone | +91 99017 39885 |
| Hours | 9:00 am – 9:00 pm (daily) |
| Maps | [Google Maps listing](https://www.google.com/maps/place/Shree+Shiksha+Academy/@13.020848,77.6730184,17z) |

## Quick start

1. Open `index.html` in a browser, or run `python3 -m http.server 8765` in this folder.
2. Push to GitHub and connect in [Netlify](https://app.netlify.com).
3. Add this site URL to your Google Business Profile (Maps currently shows “Add website”).

## Before going live

| What | Where |
|------|--------|
| Razorpay payment | Set `PAYMENT_LINK` in the `<script>` at bottom of `index.html` |
| Teachers & fees | Edit content to match your actual team and pricing |
| Email (optional) | Add if you have one — site currently uses phone/WhatsApp only |

### Razorpay setup

1. [razorpay.com](https://razorpay.com) → **Payment Links** → Create link
2. Paste into `const PAYMENT_LINK = 'https://rzp.io/l/...'` in `index.html`

## Demo form

Uses **Netlify Forms** when deployed — submissions appear in the Netlify dashboard under Forms.

## File structure

```
vidya-vriksha-tuition/
├── index.html
├── netlify.toml
└── README.md
```
